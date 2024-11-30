class Plant < ApplicationRecord
  # === Validations ===
  validates :common_name, :scientific_name, :zone, :layers, :function, presence: true
  validates :perennial, inclusion: { in: [true, false] }

  # === Scopes ===
  scope :filter_by_functions, ->(functions) { 
    where("function ILIKE ANY (array[?])", functions.map { |f| "%#{f}%" }) if functions.present? 
  }
  scope :filter_by_layers, ->(layers) { 
    where("layers ILIKE ANY (array[?])", layers.map { |l| "%#{l}%" }) if layers.present? 
  }
  scope :filter_by_zones, ->(zones) { 
    where(zone: zones) if zones.present? 
  }

  # === Overrides ===
  # Use `common_name` for URLs
  def to_param
    common_name.to_s.parameterize
  end

  # === Instance Methods ===
  # Returns "Perennial" or "Annual" for easier display in views
  def type
    perennial ? "Perennial" : "Annual"
  end

  # Converts layers into an array for easier iteration
  def layers_array
    parse_to_array(layers)
  end

  # Converts functions into an array for easier iteration
  def functions_array
    parse_to_array(function)
  end

  # Finds a plant using a case-insensitive match for `common_name`
  def self.find_by_common_name(slug)
    where("LOWER(common_name) = ?", slug.tr('-', ' ').downcase).first!
  end

  private

  # Helper to parse a comma-separated string into a trimmed array
  def parse_to_array(field)
    field.to_s.split(",").map(&:strip)
  end
end
