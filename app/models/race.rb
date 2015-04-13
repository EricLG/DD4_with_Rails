class Race < ActiveRecord::Base

  belongs_to :source
  has_and_belongs_to_many :feats, inverse_of: :pr_races
end
