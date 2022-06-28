class Entity < ApplicationRecord
  belongs_to :user
  has_many :entity_groups, dependent: :delete_all
  has_many :groups, through: :entity_groups
  accepts_nested_attributes_for :entity_groups, allow_destroy: true

  validates :name, presence: true
  validates :name, length: { in: 3..30 }

  validates :amount, numericality: { only_integer: true }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
