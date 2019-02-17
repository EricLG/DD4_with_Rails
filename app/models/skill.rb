class Skill < ActiveRecord::Base
  has_many :skill_bonuses, inverse_of: :skills
  has_many :characters, through: :ability_bonuses

  SKILLS_EN = %w[acrobatics arcana athletics bluff diplomacy dungeoneering endurance heal history insight intimidate nature perception religion stealth streetwise thievery].freeze

  SKILLS_CONVERSION_FR = {
    'acrobatics' => 'Acrobaties',
    'arcana' => 'Arcanes',
    'athletics' => 'Athlétisme',
    'bluff' => 'Bluff',
    'diplomacy' => 'Diplomatie',
    'dungeoneering' => 'Exploration',
    'endurance' => 'Endurance',
    'heal' => 'Soins',
    'history' => 'Histoire',
    'insight' => 'Intuition',
    'intimidate' => 'Intimidation',
    'nature' => 'Nature',
    'perception' => 'Perception',
    'religion' => 'Religion',
    'stealth' => 'Discrétion',
    'streetwise' => 'Connaissance de la rue',
    'thievery' => 'Larcin'
  }.freeze

  # Array - Convertie une string de compétence en tableau de compétence fr
  def self.convert_list(list, separator = ', ')
    list.split(separator).collect{ |s| Skill::SKILLS_CONVERSION_FR[s] }
  end

  def self.get_linked_carac(skill)
    case skill
    when 'athletics'
      'strength'
    when 'endurance'
      'constitution'
    when 'acrobatics', 'stealth', 'thievery'
      'dexterity'
    when 'arcana', 'history', 'religion'
      'intelligence'
    when 'dungeoneering', 'heal', 'insight', 'nature', 'perception'
      'wisdom'
    when 'bluff', 'diplomacy', 'intimidate', 'streetwise'
      'charisma'
    end
  end
end
