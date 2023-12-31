class Pet < ApplicationRecord
  belongs_to :seller, class_name: "User"
  CATEGORIES = %w[dog cat fish bird rodent amphibian reptile others].freeze
  has_many :adoptions, dependent: :destroy
  has_one_attached :photo
  validates :name, :category, :description, :breed, :photo, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  include PgSearch::Model
  pg_search_scope :search_pets,
    against: [ :category, :breed ],
      using: {
      tsearch: { prefix: true }
      }
  def adopted?
    adoptions.where(status: true).exists?
  end

  def age
    return unless birthday

    age = Date.today.year - birthday.year
    age -= 1 if Date.today < birthday + age.years
    age
  end
end
