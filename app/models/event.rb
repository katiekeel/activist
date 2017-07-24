class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location, presence: true
  validates :zipcode, presence: true
  has_and_belongs_to_many :groups, -> { distinct }
  has_and_belongs_to_many :interests, -> { distinct }
  has_and_belongs_to_many :users, -> { distinct }

  def human_dates
    [self.start_date.strftime("%A, %d %b %Y"), self.end_date.strftime("%A, %d %b %Y")]
  end

  def human_times
    [self.start_time.strftime("%l:%m %p"), self.start_time.strftime("%l:%m %p")]
  end

end
