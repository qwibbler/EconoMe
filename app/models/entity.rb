class Entity < ApplicationRecord
  belongs_to :user
  has_many :entity_groups, dependant: :delete_all
  has_many :groups, through: :entity_groups
end
