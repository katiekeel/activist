class Group < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_and_belongs_to_many :interests, dependent: :destroy
  has_and_belongs_to_many :events, dependent: :destroy
  belongs_to :contact, class_name: "User", dependent: :destroy
end
