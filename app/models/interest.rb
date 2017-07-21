class Interest < ApplicationRecord
  validates :name, presence: true
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :events
  has_and_belongs_to_many :users
end
