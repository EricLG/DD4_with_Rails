class Skill < ActiveRecord::Base

  has_one :race

  SKILL = %w(acrobatics arcana athletics bluff diplomacy dungeoneering endurance heal history insight intimidate nature perception religion stealth streetwise thievery)

  def to_s
    result = []
    result << "Acrobaties : #{acrobatics}"             if acrobatics > 0
    result << "Arcanes : #{arcana}"                    if arcana > 0
    result << "Athlétisme : #{athletics}"              if athletics > 0
    result << "Bluff : #{bluff}"                       if bluff > 0
    result << "Diplomatie : #{diplomacy}"              if diplomacy > 0
    result << "Exploration : #{dungeoneering}"         if dungeoneering > 0
    result << "Endurance : #{endurance}"               if endurance > 0
    result << "Soins : #{heal}"                        if heal > 0
    result << "Histoire : #{history}"                  if history > 0
    result << "Intuition : #{insight}"                 if insight > 0
    result << "Intimidation : #{intimidate}"           if intimidate > 0
    result << "Nature : #{nature}"                     if nature > 0
    result << "Perception : #{perception}"             if perception > 0
    result << "Religion : #{religion}"                 if religion > 0
    result << "Discrétion : #{stealth}"                if stealth > 0
    result << "Connaissance de la rue : #{streetwise}" if streetwise > 0
    result << "larcin : #{thievery}"                   if thievery > 0
    result.join(', ')
  end

  def to_s_for_class
    result = []
    SKILL.each do |s|
         result << Skill.human_attribute_name(s) if self[s] > 0
    end
    result.sort.join(', ')
  end

  def to_a
    result = []
    SKILL.each do |s|
         result << s if self[s] > 0
    end
    result
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

  def self.get_skills
    skills = {}
    Skill::SKILL.each do |s|
      skills[s] = Skill.human_attribute_name(s)
    end
    skills.sort_by{|skill, fr_skill| fr_skill}
  end

  # Reset toutes les compétences à 0
  def raz
    Skill::SKILL.each do |s|
      self.send("#{s}=", 0)
    end
  end

  # Sauvegarde le choix de bonus de compétence racial en supprimant l'ancien
  def update_racial_choice!(racial_choice)
    self.raz
    self.send("#{racial_choice}=", 2)
    self.save
  end

  # Renvoie la compétence choisie avec le bonus racial de compétence (1 seule compétence normalement)
  def get_selected_skill
    selected_skill = nil
    Skill::SKILL.each do |s|
      selected_skill = s if self.send(s) == 2
    end
    selected_skill
  end
end
