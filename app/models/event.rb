class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
  validates :zipcode, presence: true
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :interests
end
