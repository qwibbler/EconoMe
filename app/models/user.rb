class User < ApplicationRecord
  has_many :entities, dependent: :delete_all
  has_many :groups, dependent: :delete_all

  validates :name, presence: true
  validates :name, length: { in: 3..30 }
end
