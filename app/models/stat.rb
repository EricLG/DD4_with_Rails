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

  # data = "For xx, Con xx, ..."
  def self.valorize_stat(data)
    stat = Stat.new()
    data.split(', ', -1).each do |s|
      value = s.split(' ',-1)
      case value.first
      when "For"
        stat.strength     = value.last
      when "Con"
        stat.constitution = value.last
      when "Dex"
        stat.dexterity    = value.last
      when "Int"
        stat.intelligence = value.last
      when "Sag"
        stat.wisdom       = value.last
      when "Cha"
        stat.charisma     = value.last
      end
    end
    stat.save
    stat
  end
end
