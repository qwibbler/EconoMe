class Group < ApplicationRecord
  belongs_to :user
  has_many :entity_groups, dependent: :delete_all
  has_many :entities, through: :entity_groups

  validates :name, presence: true
  validates :name, length: { in: 3..30 }
end
