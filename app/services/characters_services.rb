module CharactersServices
  # Find all informations needed from @character to display show template
  def show_character
    # Load race, classe and features
    @klass = @character.klass
    @race = @character.race
    @race_features = @character.race_choices.map(&:feature)
    @classe_features = @character.klass_choices.map(&:feature)
    @classe_features_name = @classe_features.map(&:name)
    # Load abilities
    @strength = @abilities.strength
    @constitution = @abilities.constitution
    @dexterity = @abilities.dexterity
    @intelligence = @abilities.intelligence
    @wisdom = @abilities.wisdom
    @charisma = @abilities.charisma
    @fortitude_bonus = [@strength.modifier, @constitution.modifier].max
    @reflexes_bonus = [@dexterity.modifier, @intelligence.modifier].max
    @will_bonus = [@wisdom.modifier, @charisma.modifier].max

    @chosen_feats = @character.chosen_feats.joins(:feat).select('chosen_feats.*, feats.name as feat_name')
    @feats_name = @chosen_feats.map(&:feat_name)

    combat_tab
    skills_tab
    @show_languages = @character.show_languages

    @character_magic_items = @character.magic_items
    @feats_languages = @character.chosen_feats.languages
    search_equipped_items_tab_variables
  end

  def combat_tab
    # Load CommonItem
    @main_common_weapon = @character.main_weapon
    @second_hand = @character.second_hand
    @armor = @character.armor_with_heavy_info
    # Load proficiencies
    @proficiencies = @character.proficiencies(@chosen_feats)
    # Load MagicItem for commonItem
    @main_weapon_magic_item = @character.equipment.main_weapon
    @second_hand_magic_item = @character.equipment.second_hand
    @armor_magic_item = @character.equipment.armor
    @neck_magic_item = @character.equipment.neck

    @main_abilities = @klass.main_abilities

    @attack_rolls = attack_rolls
    @damage_rolls = damage_rolls
    @defenses = defenses
    @movement = movement
    @hp = hit_points
  end

  def attack_rolls
    attack_rolls = []
    proficiencies_name = @proficiencies.map(&:name)
    first_item_should_be_use = true
    [@main_common_weapon, @second_hand].each do |weapon|
      if weapon.class == CommonWeapon

        weapon_proficiency_bonus = proficiencies_name.include?(weapon.name) ? weapon.proficiency.to_i : 0
        if @classe_features_name.include?('Style du bagarreur') && CommonWeapon::HAND_FREE_WEAPONS.include?(weapon.name)
          weapon_proficiency_bonus = [weapon_proficiency_bonus.to_i, @character.bonus_per_tier(2, 4, 6)].max
        end

        alteration_bonus = first_item_should_be_use ? calcul_alteration_bonus(@main_weapon_magic_item) : calcul_alteration_bonus(@second_hand_magic_item)

        weapon_expertise_feat = @chosen_feats.select { |f| f.feat_name == 'Expertise aux armes' }.first
        feats_bonus = weapon_expertise_feat && weapon.weapon_group_ids.include?(weapon_expertise_feat.weapon_group_id) ? @character.bonus_per_tier : 0
        @main_abilities.each do |key, value|
          ab_modifier = @abilities.send(value).modifier
          attack_rolls << {
            carac: key,
            weapon: weapon.name,
            total: @character.half_level + ab_modifier + weapon_proficiency_bonus.to_i + alteration_bonus + feats_bonus,
            half_level: @character.half_level,
            ability_bonus: ab_modifier,
            proficiency: weapon_proficiency_bonus,
            alteration: alteration_bonus,
            feats: feats_bonus
          }
        end
        first_item_should_be_use = false
      end
    end
    attack_rolls
  end

  def damage_rolls
    damage_rolls = []
    first_item_should_be_use = true
    [@main_common_weapon, @second_hand].each do |weapon|
      if weapon.class == CommonWeapon

        alteration_bonus = first_item_should_be_use ? calcul_alteration_bonus(@main_weapon_magic_item) : calcul_alteration_bonus(@second_hand_magic_item)
        weapon_of_choice_feat = @chosen_feats.select { |f| f.feat_name == 'Arme de prédilection' }.first
        feats_bonus = weapon_of_choice_feat && weapon.weapon_group_ids.include?(weapon_of_choice_feat.weapon_group_id) ? @character.bonus_per_tier : 0
        @main_abilities.each do |key, value|
          ability_bonus = @abilities.send(value).modifier
          damage_rolls << {
            carac: key,
            weapon: weapon.name,
            dice: weapon.damage,
            total: ability_bonus + alteration_bonus + feats_bonus,
            ability_bonus: ability_bonus,
            alteration: alteration_bonus,
            feats: feats_bonus
          }
        end
        first_item_should_be_use = false
      end
    end
    damage_rolls
  end

  def defenses
    {
      CA: detail_defenses(:CA, @reflexes_bonus),
      Vig: detail_defenses(:Vig, @fortitude_bonus),
      Ref: detail_defenses(:Ref, @reflexes_bonus),
      Vol: detail_defenses(:Vol, @will_bonus)
    }
  end

  def detail_defenses(defense, carac_bonus)
    detail = {}
    detail[:half_level] = @character.half_level
    detail[:armor_bonus] = defense == :CA ? (@armor&.armor_bonus || 0) : 0
    detail[:shield_bonus] = check_shield_bonus(defense)
    detail[:carac_bonus] = defense == :CA && @armor&.heavy? ? 0 : carac_bonus
    detail[:race_klass_bonus] = check_sources_for_race_klass_bonus(defense)
    detail[:alteration_bonus] = defense == :CA ? calcul_alteration_bonus(@armor_magic_item) : calcul_alteration_bonus(@neck_magic_item)
    detail[:feat_bonus] = check_feats_for_defenses_bonus(defense)
    detail[:untyped_bonus] = check_sources_for_untyped_bonus(defense)
    detail[:total] = detail.values.reduce(:+) + 10
    detail
  end

  # Information to display in show character, skills tab
  def skills_tab
    skill_bonuses = @character.skill_bonuses.select_ability_total_bonus.select_skill_name.joins(:skill).joins(:ability_bonus)
    @insight = skill_bonuses.insight
    @perception = skill_bonuses.perception
    @skill_bonuses = skill_bonuses.sort_by(&:fr_name)
    @klass_choosable_skill_bonus = @character.klass.try(&:choosable_skills_to_a)
  end

  def search_equipped_items_tab_variables
    @character_common_equipped_items = [@main_common_weapon, @armor, @second_hand]
    @equipped_magic_items_partial_variables = []
    magic_stuff = @character.equipped_magic_items.joins(:source, :location).select('magic_items.*, equipment.level as level, sources.name as source_name, locations.name as location_name, locations.code as location_code')
    magic_stuff.each do |ms|
      @equipped_magic_items_partial_variables << search_show_relation(ms, true, ms.level)
    end
  end

  def calcul_alteration_bonus(equipment)
    equipment.class == Equipment ? (((equipment.level - 1) / 5) + 1).floor : 0
  end

  def check_shield_bonus(defense)
    wrestler_guard_feat = @feats_name.include?('Garde du bagarreur') ? 1 : 0
    shield_bonus = @second_hand.try(:armor_bonus) || 0
    max_shield_bonus = [shield_bonus, wrestler_guard_feat].max
    feats_bonus = case defense
                  when :CA
                    max_shield_bonus
                  when :Vig
                    0
                  when :Ref
                    max_shield_bonus
                  when :Vol
                    0
                  end
    feats_bonus
  end

  def check_sources_for_race_klass_bonus(defense)
    Race.race_defenses_bonus(defense, @race.name) + Klass.klass_defenses_bonus(defense, @klass.name)
  end

  def check_feats_for_defenses_bonus(defense)
    bonus_per_tier = @character.bonus_per_tier(2, 3, 4)
    feats_bonus = case defense
                  when :CA
                    0
                  when :Vig
                    @feats_name.include?('Vigueur renforcée') ? bonus_per_tier : 0
                  when :Ref
                    @feats_name.include?('Réflexes éclair') ? bonus_per_tier : 0
                  when :Vol
                    @feats_name.include?('Volonté de fer') ? bonus_per_tier : 0
                  end
    feats_bonus
  end

  def check_sources_for_untyped_bonus(defense)
    return Feature.brawler_style(defense, @second_hand) if @classe_features_name.include?('Style du bagarreur')
    return Feature.barbarian_agility(defense, @armor&.heavy?) if @classe_features_name.include?('Agilité du barbare')

    0
  end

  def movement
    armor_malus = @race.name == 'Nain' ? 0 : @armor&.ms_malus || 0
    mv = {}
    mv[:base] = @race.speed
    mv[:armor_malus] = armor_malus
    mv[:object_bonus] = 0
    mv[:various_bonus] = 0
    mv[:total] = mv.values.reduce(:+)
    mv
  end

  # Hash - return a hash with all info about hit points
  def hit_points
    bonus_feat_hp = @feats_name.include?('Robustesse') ? 5 * ((@character.level - 1) / 10 + 1) : 0
    full_hp = @klass.base_hp + @constitution.total_value + (@klass.hp_per_level * (@character.level - 1)) + bonus_feat_hp
    {
      total: full_hp,
      half_blooded: (full_hp / 2).floor,
      healing_surge: (full_hp / 4).floor,
      healing_surge_by_day: @klass.healing_surge + @constitution.modifier
    }
  end
end
