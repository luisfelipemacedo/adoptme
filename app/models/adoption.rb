class Adoption < ApplicationRecord
  belongs_to :adopter, class_name: "User"
  belongs_to :pet
  validates :status, presence: true
end
