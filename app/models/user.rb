class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :entities, dependent: :delete_all
  has_many :groups, dependent: :delete_all

  validates :name, presence: true
  validates :name, length: { in: 3..30 }

  after_create :seed_groups

  def seed_groups
    return unless valid?

    groups.create(name: 'Food', icon: '013-display.png')
    groups.create(name: 'Household', icon: '017-home.png')
    groups.create(name: 'Medical', icon: '003-heartbeat.png')
    groups.create(name: 'Travel', icon: '012-transportation.png')
  end
end
