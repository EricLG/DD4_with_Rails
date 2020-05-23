module CharactersServices
  # Find all informations needed from @character to display show template
  def show_character

    @klass = @character.klass
    @race = @character.race

    @strength = @abilities.strength
    @constitution = @abilities.constitution
    @dexterity = @abilities.dexterity
    @intelligence = @abilities.intelligence
    @wisdom = @abilities.wisdom
    @charisma = @abilities.charisma

    @chosen_feats = @character.chosen_feats

    combat_tab
    skills_tab
    @show_languages = @character.show_languages

    @race_features = @character.race_choices.map(&:feature)
    @classe_features = @character.klass_choices.map(&:feature)
    @character_magic_items = @character.magic_items
    @feats_languages = @character.chosen_feats.languages
    search_equipped_items_tab_variables
  end

  def combat_tab
    @proficiencies = @character.proficiencies(@chosen_feats)
    @main_common_weapon = @character.main_weapon
    @main_weapon_magic_item = @character.equipment.main_weapon
    @second_hand = @character.second_hand
    @second_hand_magic_item = @character.equipment.second_hand

    @armor = @character.armor
    @main_abilities = @character.klass.main_abilities

    @attack_rolls = attack_rolls

    @armor = @character.armor
    @second = @character.second_hand
    @defenses = {
      CA: @abilities.reflexes,
      Vig: @abilities.fortitude,
      Ref: @abilities.reflexes,
      Vol: @abilities.will
    }
    @hp = @character.hit_points
  end

  def attack_rolls
    attack_rolls = []
    proficiencies_name = @proficiencies.map(&:name)
    first_item_should_be_use = true
    [@main_common_weapon, @second_hand].each do |weapon|
      if weapon.class == CommonWeapon
        weapon_proficiency_bonus = proficiencies_name.include?(weapon.name) ? weapon.proficiency : 0

        alteration_bonus = first_item_should_be_use ? calcul_alteration_bonus(@main_weapon_magic_item) : calcul_alteration_bonus(@second_hand_magic_item)

        feats_bonus = 0

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

  def calcul_alteration_bonus(equipment)
    if equipment.class == Equipment
      (((equipment.level - 1) / 5) + 1).floor
    else
      0
    end
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
end
