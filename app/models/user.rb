class User < ApplicationRecord
  enum role: ["default", "contact", "admin"]

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :events
  has_and_belongs_to_many :interests
end
