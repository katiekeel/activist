class User < ApplicationRecord
  has_secure_password

  enum role: ["default", "admin", "contact"]

  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :events
  has_and_belongs_to_many :interests
end
