class Pet < ApplicationRecord
  belongs_to :seller, class_name: "User"
  CATEGORIES = %w[dog cat fish others].freeze
  has_many :adoptions
  validates :name, :category, :description, :breed, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
