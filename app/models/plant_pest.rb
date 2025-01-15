class PlantPest < ApplicationRecord
  belongs_to :plant
  belongs_to :pest

  # Optionally add validations
  validates :plant_id, presence: true
  validates :pest_id, presence: true
end
