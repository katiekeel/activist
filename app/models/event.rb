class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
  validates :zipcode, presence: true
  has_and_belongs_to_many :groups, dependent: :destroy
  has_and_belongs_to_many :interests, dependent: :destroy
  has_and_belongs_to_many :users, dependent: :destroy

  def human_dates
    dates = []
    dates << self.start_date.strftime("%A, %d %b %Y")
    dates << self.end_date.strftime("%A, %d %b %Y")
    dates
  end

  def human_times
    times = []
    times << self.start_time.strftime("%l:%m %p")
    times << self.end_time.strftime("%l:%m %p")
    times
  end

end
