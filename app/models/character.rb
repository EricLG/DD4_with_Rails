class Character < ActiveRecord::Base

  store_accessor :stats, :level_1_strength, :level_4_strength, :level_8_strength, :level_11_strength, :level_14_strength, :level_18_strength, :level_21_strength, :level_24_strength, :level_28_strength, :level_1_constitution, :level_4_constitution, :level_8_constitution, :level_11_constitution, :level_14_constitution, :level_18_constitution, :level_21_constitution, :level_24_constitution, :level_28_constitution, :level_1_dexterity, :level_4_dexterity, :level_8_dexterity, :level_11_dexterity, :level_14_dexterity, :level_18_dexterity, :level_21_dexterity, :level_24_dexterity, :level_28_dexterity, :level_1_intelligence, :level_4_intelligence, :level_8_intelligence, :level_11_intelligence, :level_14_intelligence, :level_18_intelligence, :level_21_intelligence, :level_24_intelligence, :level_28_intelligence, :level_1_wisdom, :level_4_wisdom, :level_8_wisdom, :level_11_wisdom, :level_14_wisdom, :level_18_wisdom, :level_21_wisdom, :level_24_wisdom, :level_28_wisdom, :level_1_charisma, :level_4_charisma, :level_8_charisma, :level_11_charisma, :level_14_charisma, :level_18_charisma, :level_21_charisma, :level_24_charisma, :level_28_charisma
  enum status: { draft: 1, complete: 2}

  belongs_to :user
  belongs_to :stat
  belongs_to :race
  belongs_to :klass
  has_and_belongs_to_many :games

  STATS = %w(strength constitution dexterity intelligence wisdom charisma)

  before_save :level_to_xp
  validates :user_id, :race_id, :klass_id, :name,  presence: true
  validates :level, presence: true, numericality: { only_integer: true }, inclusion: { :in => 1..30}
  validates :age, :weight, :height, numericality: { only_integer: true }, allow_blank: true

  def total_stat
    s = Stat.new
    s.strength = initial_stat.strength
    s.strength += race_stat.strength
    s.strength += level_4.strength  if level >= 4
    s.strength += level_8.strength  if level >= 8
    s.strength += level_11.strength if level >= 11
    s.strength += level_14.strength if level >= 14
    s.strength += level_18.strength if level >= 18
    s.strength += level_21.strength if level >= 21
    s.strength += level_24.strength if level >= 24
    s.strength += level_28.strength if level >= 28
    s.constitution = initial_stat.constitution
    s.constitution += race_stat.constitution
    s.constitution += level_4.constitution  if level >= 4
    s.constitution += level_8.constitution  if level >= 8
    s.constitution += level_11.constitution if level >= 11
    s.constitution += level_14.constitution if level >= 14
    s.constitution += level_18.constitution if level >= 18
    s.constitution += level_21.constitution if level >= 21
    s.constitution += level_24.constitution if level >= 24
    s.constitution += level_28.constitution if level >= 28
    s.dexterity = initial_stat.dexterity
    s.dexterity += race_stat.dexterity
    s.dexterity += level_4.dexterity  if level >= 4
    s.dexterity += level_8.dexterity  if level >= 8
    s.dexterity += level_11.dexterity if level >= 11
    s.dexterity += level_14.dexterity if level >= 14
    s.dexterity += level_18.dexterity if level >= 18
    s.dexterity += level_21.dexterity if level >= 21
    s.dexterity += level_24.dexterity if level >= 24
    s.dexterity += level_28.dexterity if level >= 28
    s.intelligence = initial_stat.intelligence
    s.intelligence += race_stat.intelligence
    s.intelligence += level_4.intelligence  if level >= 4
    s.intelligence += level_8.intelligence  if level >= 8
    s.intelligence += level_11.intelligence if level >= 11
    s.intelligence += level_14.intelligence if level >= 14
    s.intelligence += level_18.intelligence if level >= 18
    s.intelligence += level_21.intelligence if level >= 21
    s.intelligence += level_24.intelligence if level >= 24
    s.intelligence += level_28.intelligence if level >= 28
    s.wisdom = initial_stat.wisdom
    s.wisdom += race_stat.wisdom
    s.wisdom += level_4.wisdom  if level >= 4
    s.wisdom += level_8.wisdom  if level >= 8
    s.wisdom += level_11.wisdom if level >= 11
    s.wisdom += level_14.wisdom if level >= 14
    s.wisdom += level_18.wisdom if level >= 18
    s.wisdom += level_21.wisdom if level >= 21
    s.wisdom += level_24.wisdom if level >= 24
    s.wisdom += level_28.wisdom if level >= 28
    s.charisma = initial_stat.charisma
    s.charisma += race_stat.charisma
    s.charisma += level_4.charisma  if level >= 4
    s.charisma += level_8.charisma  if level >= 8
    s.charisma += level_11.charisma if level >= 11
    s.charisma += level_14.charisma if level >= 14
    s.charisma += level_18.charisma if level >= 18
    s.charisma += level_21.charisma if level >= 21
    s.charisma += level_24.charisma if level >= 24
    s.charisma += level_28.charisma if level >= 28
    return s.to_s
  end

  def is_paragon?
    level >= 11 if level
  end
  def is_epic?
    level >= 21 if level
  end

  def level_to_xp
    self.experience = case self.level
                      when 2
                        1_000
                      when 3
                        2_250
                      when 4
                        3_750
                      when 5
                        5_500
                      when 6
                        7_500
                      when 7
                        10_000
                      when 8
                        13_000
                      when 9
                        16_500
                      when 10
                        20_500
                      when 11
                        26_000
                      when 12
                        32_000
                      when 13
                        39_000
                      when 14
                        47_000
                      when 15
                        57_000
                      when 16
                        69_000
                      when 17
                        83_000
                      when 18
                        99_000
                      when 19
                        119_000
                      when 20
                        143_000
                      when 21
                        175_000
                      when 22
                        210_000
                      when 23
                        255_000
                      when 24
                        310_000
                      when 25
                        375_000
                      when 26
                        450_000
                      when 27
                        550_000
                      when 28
                        675_000
                      when 29
                        825_000
                      when 30
                        1_000_000
                      else
                        0
                      end
  end

  def xp_to_level
    self.level = case (self.experience/1000).to_f
    when 0 ... 1
      1
    when 1 ... 2.25
      2
    when 2.25 ... 3.75
      3
    when 3.75 ... 5.5
      4
    when 5.5 ... 7.5
      5
    when 7.5 ... 10
      6
    when 10 ... 13
      7
    when 13 ... 16.5
      8
    when 16.5 ... 20.5
      9
    when 20.5 ... 26
      10
    when 26 ... 32
      11
    when 32 ... 39
      12
    when 39 ... 47
      13
    when 47 ... 57
      14
    when 57 ... 69
      15
    when 69 ... 83
      16
    when 83 ... 99
      17
    when 99 ... 119
      18
    when 119 ... 143
      19
    when 143 ... 175
      20
    when 175 ... 210
      21
    when 210 ... 255
      22
    when 255 ... 310
      23
    when 310 ... 375
      24
    when 375 ... 450
      25
    when 450 ... 550
      26
    when 550 ... 675
      27
    when 675 ... 825
      28
    when 825 ... 1000
      29
    else
      30
    end if self.experience
  end
end
