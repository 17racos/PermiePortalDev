class CreateGuides < ActiveRecord::Migration[7.0]
  def change
    create_table :guides do |t|
      t.string :title
      t.text :body
      t.string :image # Adds an image column for guide-specific images
      t.string :slug, unique: true # Adds a unique slug column for SEO-friendly URLs

      t.timestamps
    end

    # Adding an index to the slug for faster lookups
    add_index :guides, :slug, unique: true
  end
end
