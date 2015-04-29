class Klass < ActiveRecord::Base

  belongs_to :source
  has_many :class_features
  has_and_belongs_to_many :feat, inverse_of: :pr_klasses
end
