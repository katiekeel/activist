class User < ApplicationRecord
  has_secure_password

  enum role: ["default", "admin", "contact"]

  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :groups, -> { distinct }
  has_and_belongs_to_many :events, -> { distinct }
  has_and_belongs_to_many :interests, -> { distinct }
end
