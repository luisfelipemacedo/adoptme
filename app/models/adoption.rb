class Adoption < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :pet
end
