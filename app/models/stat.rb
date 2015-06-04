class Stat < ActiveRecord::Base

  belongs_to :feat

  def to_s
    result = []
    result << "For #{strength}"     if strength
    result << "Con #{constitution}" if constitution
    result << "Dex #{dexterity}"    if dexterity
    result << "Int #{intelligence}" if intelligence
    result << "Sag #{wisdom}"       if wisdom
    result << "Cha #{charisma}"     if charisma

    result.join(', ')
  end
end
