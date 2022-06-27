class User < ApplicationRecord
  has_many :entities, dependant: :delete_all
  has_many :groups, dependant: :delete_all

  validates :name, presence: true
  validates :name, length: { in: 3..30 }
end
