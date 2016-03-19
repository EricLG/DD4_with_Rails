class Stat < ActiveRecord::Base

  after_initialize :init
  belongs_to :feat
  belongs_to :race

  validates_numericality_of  :strength, :constitution, :dexterity, :intelligence, :wisdom, :charisma, only_integer: true, allow_nil: true    if Proc.new { |s| s.kind != 'initial' }
  validates_numericality_of  :strength, :constitution, :dexterity, :intelligence, :wisdom, :charisma, only_integer: true, allow_blank: false if Proc.new { |s| s.kind == 'initial' }
  validate  :level_choice, if: Proc.new {|s|  /level_(4|8)|(14|18)|(24|28)/ =~ s.kind }

  def init
    if self.new_record?
      self.strength      ||= 0
      self.constitution  ||= 0
      self.dexterity     ||= 0
      self.intelligence  ||= 0
      self.wisdom        ||= 0
      self.charisma      ||= 0
    end
  end

  def level_choice
    if (strength + constitution + dexterity + intelligence + wisdom + charisma) > 2
      errors.add(:kind, "trop de valeur sélectionné")
    end
  end

  def is_initial?
    kind == 'initial'
  end

  def to_s
    result = []
    result << "For #{strength}"     if strength > 0
    result << "Con #{constitution}" if constitution > 0
    result << "Dex #{dexterity}"    if dexterity > 0
    result << "Int #{intelligence}" if intelligence > 0
    result << "Sag #{wisdom}"       if wisdom > 0
    result << "Cha #{charisma}"     if charisma > 0

    result.join(', ')
  end

  # data = "For xx, Con xx, ..."
  def self.valorize_stat(data, type = 'feat')
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
    stat.kind = type
    stat.save
    stat
  end

end
