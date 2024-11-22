class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.string :title
      t.text :description
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
