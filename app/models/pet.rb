class Pet < ApplicationRecord
  belongs_to :seller, class_name: "User"
  CATEGORIES = %w[dog cat fish bird rodent amphibian reptile others].freeze
  has_many :adoptions
  has_one_attached :photo
  validates :name, :category, :description, :breed, :photo, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  include PgSearch::Model
  pg_search_scope :search_pets,
    against: [ :category, :breed ],
      using: {
      tsearch: { prefix: true }
      }
end
