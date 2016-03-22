class Klass < ActiveRecord::Base

  belongs_to :source
  belongs_to :available_skills, :class_name => 'Skill'
  has_many :skills
  has_and_belongs_to_many :armor_categories
  has_and_belongs_to_many :weapon_categories
  has_and_belongs_to_many :common_weapons
  has_and_belongs_to_many :implement_groups
  has_and_belongs_to_many :klass_features
  has_and_belongs_to_many :prerequisite_for_feats, :class_name => "Feat", :join_table => :pr_klasses_for_feat
  #has_and_belongs_to_many :available_skills, :class_name => "Skill", :join_table => :available_skills_for_klass
  has_and_belongs_to_many :required_skills, :class_name => "Skill", :join_table => :required_skills_for_klass
end
