class User < ApplicationRecord
  has_secure_password

  enum role: ["default", "admin", "contact"]

  validates :name, presence: true, uniqueness: true

  has_and_belongs_to_many :groups, dependent: :destroy
  has_and_belongs_to_many :events, dependent: :destroy
  has_and_belongs_to_many :interests, dependent: :destroy
end
