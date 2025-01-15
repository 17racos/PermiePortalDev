class Pest < ApplicationRecord
  # === Associations ===
  has_many :plant_pests, dependent: :destroy
  has_many :plants, through: :plant_pests

  # === Validations ===
  validates :name, presence: true, uniqueness: true
  validates :slug, uniqueness: true

  # === Callbacks ===
  before_validation :generate_slug, on: :create

  # === Public Methods ===

  # Use slug as the URL parameter
  def to_param
    slug
  end

  # Generate the image path dynamically
  def image_path
    "pests/#{picture.presence || 'placeholder.jpg'}"
  end

  # === Private Methods ===
  private

  # Generate a slug based on the name
  def generate_slug
    self.slug ||= name.parameterize if name.present?
  end
end
