class User < ApplicationRecord
  has_many :entities, dependant: :delete_all
  has_many :groups, dependant: :delete_all
end
