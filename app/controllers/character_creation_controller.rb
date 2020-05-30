class CharacterCreationController < ApplicationController
  include CharacterCreation
  before_action :find_dependancies, except: %i[resume_race resume_klass]

  def choose_race
    @races = Race.all.order(:name)
  end

  def save_race
    if @character.update(character_params)
      redirect_to choose_class_character_creation_path(@character.id)
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :choose_race
    end
  end

  def choose_class
    @klasses = Klass.select(:id, :name, :role).all.group_by(&:role)
  end

  def save_class
    if @character.update(character_params)
      redirect_to choose_optional_fields_character_creation_path @character.id
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :choose_class
    end
  end

  def choose_optional_fields
    @gods = God.all.order(:name)
    @known_languages = @character.race.known_level_1_languages
    @languages = @character.race.available_level_1_languages
    @alignment = Character::ALIGNMENT
  end

  def save_optional_fields
    # TODO : FAIRE UN CONTROLE SUR LE NOMBRE DE LANGUES CHOISIES
    params['character']['language_ids'].delete('')
    @character.language_ids.clear
    if @character.update(character_params)
      redirect_to choose_abilities_character_creation_path @character.id
    else
      msg = ''
      @character.errors.messages.each do |k, v|
        msg += k.to_s.capitalize + ' : ' + v.first + "\r\n"
      end
      flash[:error] = "Erreur sur les champs suivants :\r\n #{msg}"
      redirect_to choose_optional_fields_character_creation_path @character.id
    end
  end

  def choose_abilities
    @char_abilities = @character.initialize_ability_bonuses
    @racial_bonus_chosen = @character.racial_bonus_chosen(@char_abilities)
    @random_abilities = Character.random_abilities
  end

  def save_abilities
    @character.assign_attributes(character_params)
    @character.calcul_abilities
    @character.save
    if @character.update(character_params)
      redirect_to choose_features_character_creation_path @character.id
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :choose_abilities
    end
  end

  def choose_features
    race_features = @character.race.features
    @race_features = {
      required: race_features.required,
      first_choice: race_features.first_choice
    }
    klass_features = @character.klass.features.order(:name)
    @klass_features = {
      required: klass_features.required_with_no_children.to_a,
      first_choice: klass_features.first_choice.to_a,
      second_choice: klass_features.second_choice.to_a,
      third_choice: klass_features.third_choice.to_a
    }
    @first_choice_parent = @klass_features[:first_choice].first.parent_feature unless @klass_features[:first_choice].empty?
    @second_choice_parent = @klass_features[:second_choice].first.parent_feature unless @klass_features[:second_choice].empty?
    @third_choice_parent = @klass_features[:third_choice].first.parent_feature unless @klass_features[:third_choice].empty?
  end

  def save_features
    if params && params['character']
      choices = params['character']['character_choice_ids'].values.flatten
      @character.choices.features_choices.delete_all
      features = Feature.find choices
      features.each do |f|
        choices << f.parent_feature_id unless f.parent_feature_id.nil?
      end
      choices = choices.uniq
      choices.each do |c|
        Choice.create(character: @character, feature_id: c)
      end
    end
    # Etape suivante : choix des compétences
    if @character.save
      redirect_to choose_skills_character_creation_path(@character.id)
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :choose_features
    end
  end

  def choose_skills
    # Récupération des bonus dynamiques apportés par les races et classes
    @race_choosable_skill_bonus = @character.race.choosable_skill_bonus_to_a
    @klass_choosable_skill_bonus = @character.klass.choosable_skills_to_a
    @character_chosen_training_skill = @character.chosen_training_skill

    # Gestion des bonus apportés par des aptitudes raciales
    @bonus_from_feature = @character.show_training_bonus_rule(@character.race.features.main_ft)

    # Initialisation des choix de compétences de classes
    @char_skills = @character.initialize_skill_bonuses(
      @character.race.skill_bonuses_to_a,
      @character.klass.required_skills_to_a,
      @character.ability_bonuses.joins(:ability)
    )
    # Si le personnage existe déjà, on vérifie si les différents bonus dynamiques ont déjà été choisi
    @racial_bonus_already_chosen = @character.racial_skill_bonus_chosen?(@char_skills, @race_choosable_skill_bonus)
  end

  def save_skills
    if @character.klass.name == 'Rôdeur'
      required_skill_chosen = @character.validate_skill_training(
        character_params[:skill_bonuses_attributes],
        %i[nature dungeoneering]
      )
      unless required_skill_chosen
        flash[:error] = 'En tant que rôdeur, vous devez choisir Exploration ou Nature'
        redirect_to choose_skills_character_creation_path @character.id and return
      end
    end

    if @character.klass.name == 'Voleur'
      required_skill_chosen = @character.validate_skill_training(
        character_params[:skill_bonuses_attributes],
        %i[stealth thievery]
      )
      unless required_skill_chosen
        flash[:error] = 'En tant que voleur, vous devez choisir Discrétion ou Larcin'
        redirect_to choose_skills_character_creation_path @character.id and return
      end
    end

    @character.assign_attributes(character_params)
    @character.complete!
    if @character.save
      redirect_to choose_feats_character_creation_path @character.id
    else
      find_dependancies
      flash[:error] = "Erreur sur les champs suivants: #{@character.errors.full_messages}"
      render :choose_skills
    end
  end

  # TODO : Gerer les talents selectionnable plusieurs fois
  def choose_feats
    check_for_free_feats
    @acquired_feats = @character.chosen_feats.where(free: false).count
    @max_feats = @character.max_feats
    @categories = Feat.check_categories(@character.level)
    @feats = Feat.select(:id, :name, :avantage, :category).choosable_feats(@character.race_id, @character.klass_id, @categories, @character.feat_ids)
    @new = @character.chosen_feats.build if @acquired_feats < @max_feats
    load_additionnals_models
  end

  def save_feats
    languages_params = params['character']['chosen_feats_attributes']['0'].delete('language_ids').reject(&:empty?)
    if @character.update(character_params)
      save_feats_additional_info(languages_params) if languages_params
      if @character.chosen_feats.where(free: false).count >= @character.max_feats
        redirect_to character_path @character.id
      else
        redirect_to choose_feats_character_creation_path @character.id
      end
    else
      msg = ''
      @character.errors.messages.each do |k, v|
        msg += k.to_s.capitalize + ' : ' + v.first + "\r\n"
      end
      flash[:error] = "Erreur sur les champs suivants :\r\n #{msg}"
      redirect_to choose_feats_character_creation_path @character.id
    end
  end

  def save_feats_additional_info(languages_params)
    cf = @character.chosen_feats.last
    cf.language_ids = languages_params
    cf.save
  end

  # Ajax request
  def resume_race
    @race = Race.find(params[:race_id])
    respond_to do |format|
      format.js
    end
  end

  def resume_klass
    @klass = Klass.find(params[:klass_id])
    respond_to do |format|
      format.js
    end
  end

  private

  # TODO :  prendre en compte les talents pour charger les models additionelles
  def load_additionnals_models
    @languages = Language.where.not(id: @character.language_ids)
    @weapons = CommonWeapon.where.not(id: @character.klass.mastered_weapon_proficiencies).order(:name)
    @not_trained_skills = Skill.where.not(name: @character.chosen_training_skill.keep_if { |_k, v| v == 5 }.keys).pluck(:name, :id).map do |skill|
      [Skill::SKILLS_CONVERSION_FR[skill.first], skill.last]
    end
    @already_trained_skills = Skill.where.not(name: @character.chosen_training_skill.keep_if { |_k, v| v.zero? }.keys).pluck(:name, :id).map do |skill|
      [Skill::SKILLS_CONVERSION_FR[skill.first], skill.last]
    end
    @weapon_groups = WeaponGroup.select(:id, :name)
    @implements = ImplementGroup.select(:id, :name)
  end

  def find_dependancies
    @character = Character.find_by_id(params['id'])
    @abilities = @character.ability_bonuses.select_ability_name.joins(:ability)
    @skills = @character.skill_bonuses.select_skill_name.joins(:skill).joins(:ability_bonus)
  end

  def check_for_free_feats
    owned_feats_ids = @character.feats.map(&:id)
    chosen_features_names = @character.features.map(&:name)
    character_id = @character.id
    if Character::RITUAL_CASTER.include?(@character.klass.name == 'Prêtre')
      ChosenFeat.add_free_feat('Lanceur de rituels', owned_feats_ids, character_id)
    elsif chosen_features_names.include?('Style de combat à deux armes')
      ChosenFeat.add_free_feat('Robustesse', owned_feats_ids, character_id)
    elsif chosen_features_names.include?('Style de combat à distance')
      ChosenFeat.add_free_feat('Agilité défensive', owned_feats_ids, character_id)
    elsif chosen_features_names.include?('Style de combat du chasseur')
      ChosenFeat.add_free_feat('Arme en main', owned_feats_ids, character_id)
    elsif chosen_features_names.include?('Style de combat du maraudeur') || chosen_features_names.include?('Technique de la tempête')
      ChosenFeat.add_free_feat('Défense à deux armes', owned_feats_ids, character_id)
    elsif chosen_features_names.include?('Tireur d\'élite')
      ChosenFeat.add_free_feat('Tir lointain', owned_feats_ids, character_id)
    end
  end
end
