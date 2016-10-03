class Character < ActiveRecord::Base

  enum status: { draft: 1, complete: 2}

  belongs_to :user
  belongs_to :stat
  belongs_to :race
  belongs_to :klass
  belongs_to :god
  has_and_belongs_to_many :games
  has_many :choices, inverse_of: :character
  has_many :features, through: :choices
  has_many :languages, through: :choices

  has_many :klass_choices,  -> {klass_features_choices},  class_name: "Choice"
  has_many :race_choices,   -> {race_features_choices},   class_name: "Choice"

  STATS = %w(strength constitution dexterity intelligence wisdom charisma)
  LEVEL_STATS = %w(4 8 11 14 18 21 24 28)
  DEFAULT_STATS = [10, 10, 10, 10, 10, 8]

  #before_save :level_to_xp
  #validates :user_id, :race_id, :klass_id, :name,  presence: true
  #validates :level, presence: true, numericality: { only_integer: true }, inclusion: { :in => 1..30}
  #validates :age, :weight, :height, numericality: { only_integer: true }, allow_blank: true

  def self.meta_store_accessor
    methods = []
    [1, 4, 8, 11, 14, 18, 21, 24, 28].each do |l|
      STATS.each do |s|
        methods << ":level_#{l}_#{s}"
      end
    end
    eval "store_accessor :stats, #{methods.join(', ')}, :racial_stat_id"
  end

  meta_store_accessor

  def show_languages
    if self.languages.empty?
      "Vous ne parlez aucune langue. C'est dommage."
    else
      self.languages.map(&:language).join(", ")
    end
  end

  def total_stat(carac)
    total_carac = self.send("level_1_#{carac}").to_i
    LEVEL_STATS.each do |l|
      total_carac += self.send("level_#{l}_#{carac}").to_i if level >= l.to_i
    end
    total_carac += self.racial_stats.send(carac).to_i if racial_stat_id
    return total_carac
  end

  def racial_stats
    Stat.find(racial_stat_id)
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
