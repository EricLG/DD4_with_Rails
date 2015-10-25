class Stat < ActiveRecord::Base

  belongs_to :feat

  validates  :strength, :constitution, :dexterity, :intelligence, :wisdom, :charisma, numericality: { only_integer: true }, allow_blank: true if Proc.new { |s| !s.is_initial? }
  validates  :strength, :constitution, :dexterity, :intelligence, :wisdom, :charisma, numericality: { only_integer: true }, allow_blank: false if Proc.new { |s| s.is_initial? }
  validate  :level_choice, if: Proc.new {|s|  /level_(4|8)|(14|18)|(24|28)/ =~ s.kind }

  def level_choice
    if total_stat > 2
      errors.add(:kind, "trop de valeur sélectionné")
    end
  end

  def is_initial?
    kind == 'initial'
  end

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
    stat.kind = 'feat'
    stat.save
    stat
  end

  def total_stat
    t = strength + constitution + dexterity + intelligence + wisdom + charisma
  end
end
