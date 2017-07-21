class Interest < ApplicationRecord
  validates :name, presence: true
  has_and_belongs_to_many :groups, -> { distinct }
  has_and_belongs_to_many :events, -> { distinct }
  has_and_belongs_to_many :users, -> { distinct }
end
