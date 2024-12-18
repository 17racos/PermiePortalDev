class Plant < ApplicationRecord
  def self.find_by_common_name(common_name)
    where("LOWER(common_name) = ?", common_name.downcase).first
  end
  
  # === Validations ===
  validates :common_name, uniqueness: true
  validates :common_name, :scientific_name, :zone, :layers, :plant_function, presence: true
  validates :description, length: { maximum: 65535 }, allow_blank: true
  validates :perennial, inclusion: { in: [true, false] }
  validates :purpose, length: { maximum: 65535 }, presence: true


  # === Instance Methods ===
  def to_param
    common_name.parameterize  # Ensure that common_name is used in the URL
  end

  def type
    perennial ? "Perennial" : "Annual"
  end

  def layers_array
    parse_to_array(layers)
  end

  def functions_array
    plant_function
  end

  # === Scopes ===
  scope :filter_by_plant_function, ->(functions) { 
    where("plant_function && ARRAY[:functions]::text[]", functions: functions)
  }

  scope :filter_by_layers, ->(layers) { 
    where("layers && ARRAY[:layers]::text[]", layers: layers)
  }

  scope :filter_by_zones, ->(zone) { 
    where("zone && ARRAY[:zone]::text[]", zone: zone)
  }



  private

  def parse_to_array(field)
    JSON.parse(field) rescue field.to_s.split(",").map(&:strip)
  end
end
