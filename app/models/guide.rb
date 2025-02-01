class Guide < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  # You no longer need the has_many association for images
  validates :title, presence: true
  validates :body, presence: true
  validates :image_url, presence: true # Optional: Add validation for the image_url
end
