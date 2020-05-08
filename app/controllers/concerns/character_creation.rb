module CharacterCreation
  extend ActiveSupport::Concern

  private def character_params
    params.require(:character).permit(
      :name,
      :level,
      :experience,
      :parangon,
      :epic,
      :age,
      :height,
      :weight,
      :alignment,
      :divinity,
      :party,
      :user_id,
      :race_id,
      :klass_id,
      :god_id,
      :stats,
      :avatar,
      :racial_stat_id,
      :racial_bonus_choice,
      :roleplay,
      game_ids: [],
      language_ids: [],
      campaign_ids: [],
      chosen_feats_attributes: [
        :character_id,
        :feat_id,
        :information,
        :weapon_group_id,
        :proficiency_id,
        :implement_group_id,
        :ability_id,
        :skill_id,
        language_ids: []
      ],
      ability_bonuses_attributes: %i[
        id initial_value bonus_racial
        level_4 level_8 level_11 level_14 level_18 level_21 level_24 level_28
      ],
      skill_bonuses_attributes: %i[id racial training]
    )
  end
end
