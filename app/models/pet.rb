class Pet < ApplicationRecord
  belongs_to :seller, class_name: "User"
  has_many :adoptions
  validates :name, :category, :description, :breed,  presence: true
end
