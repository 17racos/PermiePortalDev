class Guide < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true # Validating the image column

end
