class Skill < ActiveRecord::Base

  has_one :race

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
end
