class Interest < ApplicationRecord
  validates :name, presence: true
  has_and_belongs_to_many :groups, dependent: :destroy
  has_and_belongs_to_many :events, dependent: :destroy
  has_and_belongs_to_many :users, dependent: :destroy
end
