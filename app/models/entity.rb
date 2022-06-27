class Entity < ApplicationRecord
  belongs_to :user
  has_many :entity_groups, dependant: :delete_all
  has_many :groups, through: :entity_groups

  validates :name, presence: true
  validates :name, length: { in: 3..30 }

  validates :amount, numericality: { only_integer: true }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
