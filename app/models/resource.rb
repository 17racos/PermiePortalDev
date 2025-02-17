# app/models/resource.rb
class Resource < ApplicationRecord
  belongs_to :user

  # Simple search method using ActiveRecord
  def self.search(query)
    return all if query.blank?

    where("title ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%")
  end
end