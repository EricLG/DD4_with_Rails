class Character < ActiveRecord::Base

  belongs_to :user
  belongs_to :stat
  belongs_to :race
  belongs_to :klass
  has_and_belongs_to_many :games

  before_save :xp_to_levels
  validates :user_id, :race_id, :klass_id, :name, :experience,  presence: true
  validates :experience, numericality: { only_integer: true }
  validates :age, :weight, :height, numericality: { only_integer: true }, allow_blank: true

  def xp_to_levels
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
