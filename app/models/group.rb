class Group < ApplicationRecord
  belongs_to :user
  has_many :entity_groups, dependant: :delete_all
  has_many :entities, through: :entity_groups
end
