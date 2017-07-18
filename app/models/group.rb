class Group < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :events
end