class Plant < ApplicationRecord
  # === Validations ===
  validates :common_name, :scientific_name, :zone, :layers, :function, presence: true
  validates :perennial, inclusion: { in: [true, false] }

  # === Scopes ===
  scope :filter_by_functions, ->(functions) {
    if functions.present?
      where("LOWER(function) SIMILAR TO ?", "%(#{functions.map { |f| Regexp.escape(f.downcase) }.join('|')})%")
    end
  }

  scope :filter_by_layers, ->(layers) {
    if layers.present?
      where("LOWER(layers) SIMILAR TO ?", "%(#{layers.map { |l| Regexp.escape(l.downcase) }.join('|')})%")
    end
  }

  scope :filter_by_zones, ->(zones) {
    where(zone: zones) if zones.present?
  }

  # === Instance Methods ===

  # Returns "Perennial" or "Annual" for easier display in views
  def type
    perennial ? "Perennial" : "Annual"
  end

  # Splits layers into an array for easier iteration
  def layers_array
    split_field(layers)
  end

  # Splits functions into an array for easier iteration
  def functions_array
    split_field(function)
  end

  private

  # Helper to split a string into an array, trimming whitespace
  def split_field(field)
    field.to_s.split(",").map(&:strip).reject(&:blank?)
  end
end
