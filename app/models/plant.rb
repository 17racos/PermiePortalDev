class Plant < ApplicationRecord
  # === Validations ===
  validates :common_name, uniqueness: true
  validates :common_name, :scientific_name, :zone, :layers, :plant_function, :purpose, presence: true
  validates :description, length: { maximum: 65535 }, allow_blank: true
  validates :perennial, inclusion: { in: [true, false] }
  validates :purpose, length: { maximum: 65535 }

  # === Scopes ===
  scope :filter_by_plant_function, ->(functions) {
    where("ARRAY[:functions]::text[] <@ plant_function", functions: functions)
  }  

  scope :filter_by_layers, ->(layers) {
    where("ARRAY[:layers]::text[] <@ layers", layers: layers)
  }

  scope :filter_by_zones, ->(zones) {
    where("ARRAY[:zones]::text[] <@ zone", zones: zones)
  }

  # === Instance Methods ===
  
  # Use common_name as a URL-friendly parameter
  def to_param
    common_name.parameterize
  end

  # Return the plant type based on perennial attribute
  def type
    perennial ? "Perennial" : "Annual"
  end

  # Parse layers into an array
  def layers_array
    parse_to_array(layers)
  end

  # Parse plant functions into an array
  def functions_array
    parse_to_array(plant_function)
  end

  # === Class Methods ===
  
  # Find plant by its common name, case-insensitive
  def self.find_by_common_name(common_name)
    find_by("LOWER(common_name) = ?", common_name.downcase)
  end

  private

  # Helper to parse fields into arrays
  def parse_to_array(field)
    return [] if field.blank?

    case field
    when String
      field.split(",").map(&:strip)
    when Array
      field
    else
      JSON.parse(field) rescue []
    end
  end
end
