class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      # Only add necessary columns, checking if they are already present
      unless column_exists?(:users, :encrypted_password)
        t.string :encrypted_password, null: false, default: ""
      end

      unless column_exists?(:users, :reset_password_token)
        t.string :reset_password_token
      end

      unless column_exists?(:users, :reset_password_sent_at)
        t.datetime :reset_password_sent_at
      end

      unless column_exists?(:users, :remember_created_at)
        t.datetime :remember_created_at
      end

      # Optionally, add more Devise columns if needed
      # t.integer :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string :current_sign_in_ip
      # t.string :last_sign_in_ip
    end

    # Add the reset password token index if not already present
    unless index_exists?(:users, :reset_password_token)
      add_index :users, :reset_password_token, unique: true
    end
  end
end

