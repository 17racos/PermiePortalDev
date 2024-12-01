class Plant < ApplicationRecord
  # === Validations ===
  validates :common_name, :scientific_name, :zone, :layers, :function, presence: true
  validates :description, length: { maximum: 65535 }, allow_blank: true
  validates :perennial, inclusion: { in: [true, false] }
  validates :purpose, length: { maximum: 65535 }, presence: true # Optional field

  # === Scopes ===
  scope :filter_by_functions, ->(functions) { 
    where("function ILIKE ANY (array[?])", prepare_filters(functions)) if functions.present?
  }
  scope :filter_by_layers, ->(layers) { 
    where("layers ILIKE ANY (array[?])", prepare_filters(layers)) if layers.present?
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

  # Parses and returns `layers` as an array
  def layers_array
    parse_to_array(layers)
  end

  # Parses and returns `functions` as an array
  def functions_array
    parse_to_array(function)
  end

  # === Class Methods ===
  class << self
    # Finds a plant by `common_name` using a case-insensitive slug match
    def find_by_common_name(slug)
      where("LOWER(common_name) = ?", slug.tr('-', ' ').downcase).first!
    end

    # Prepares filters for SQL ILIKE ANY
    def prepare_filters(values)
      values.map { |value| "%#{value}%" }
    end
  end

  private

  # Helper to parse a comma-separated string into a trimmed array
  def parse_to_array(field)
    JSON.parse(field) rescue field.to_s.split(",").map(&:strip)
  end
end
