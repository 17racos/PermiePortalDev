class Plant < ApplicationRecord
  # === Associations ===
  has_many :plant_pests, dependent: :destroy
  has_many :pests, through: :plant_pests

  # === Validations ===
  validates :common_name, presence: true, uniqueness: { case_sensitive: false }
  validates :scientific_name, :zone, :layers, :plant_function, :purpose, presence: true
  validates :description, length: { maximum: 65_535 }, allow_blank: true
  validates :purpose, length: { maximum: 65_535 }
  validates :perennial, inclusion: { in: [true, false] }

  # === Instance Methods ===

  # Generate a URL-friendly parameter using common_name
  def to_param
    common_name.parameterize
  end

  # === Class Methods ===

  # Find a plant by its parameterized common_name
  def self.find_by_common_name(parameterized_name)
    where("LOWER(common_name) = ?", parameterized_name.downcase).first
  end

  # Parse a given field into an array
  def parsed_array(field)
    Array.wrap(field).map(&:strip)
  end

  # Parsed layers array
  def layers_array
    parsed_array(layers)
  end

  # Parsed plant functions array
  def functions_array
    parsed_array(plant_function)
  end

  # Retrieve valid associated pests
  def valid_pests
    pests.distinct
  end
end
