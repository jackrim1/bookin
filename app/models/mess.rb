class Mess < ApplicationRecord
  validates :name, presence: true
  has_many :users
  has_many :events
end
