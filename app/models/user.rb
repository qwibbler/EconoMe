class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :entities, dependent: :delete_all
  has_many :groups, dependent: :delete_all

  validates :name, presence: true
  validates :name, length: { in: 3..30 }
end
