class Plant < ApplicationRecord
  # === Validations ===
  validates :common_name, uniqueness: true
  validates :common_name, :scientific_name, :zone, :layers, :plant_function, presence: true
  validates :description, length: { maximum: 65535 }, allow_blank: true
  validates :perennial, inclusion: { in: [true, false] }
  validates :purpose, length: { maximum: 65535 }, presence: true
  validates :conditions, length: { maximum: 65535 }, presence: true

  # === Instance Methods ===
  def to_param
    common_name.to_s.parameterize  # No need to modify the case anymore
  end

  # === Scopes ===
  # Scope to filter by plant_function
  scope :filter_by_plant_function, ->(functions) { 
    where("plant_function && ARRAY[:functions]::text[]", functions: functions)
  }
  # Scope to filter by layers
  scope :filter_by_layers, ->(layers) { 
    where("layers && ARRAY[:layers]::text[]", layers: layers)  # Fix: use :layers here
  }
  # Scope to filter by zone
  scope :filter_by_zones, ->(zone) { 
    where("zone && ARRAY[:zone]::text[]", zone: zone)
  } 

  # === Instance Methods ===
  # Returns "Perennial" or "Annual" for easier display in views
  def type
    perennial ? "Perennial" : "Annual"
  end

  # Parses and returns `layers` as an array
  def layers_array
    parse_to_array(layers)
  end

  # Parses and returns `functions` as an array
  def functions_array
    # Ensure that plant_function is treated as an array
    plant_function
  end

  # === Class Methods ===
  class << self
    # Finds a plant by `common_name` using case-insensitive match
    def find_by_common_name(slug)
      where("LOWER(common_name) = ?", slug.downcase).first!  # Use downcase for case-insensitive search
    end
  end
end

  private

  # Helper to parse a comma-separated string into a trimmed array
  def parse_to_array(field)
    JSON.parse(field) rescue field.to_s.split(",").map(&:strip)
  end

