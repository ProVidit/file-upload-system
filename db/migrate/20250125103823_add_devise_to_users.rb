# db/migrate/20250125103823_add_devise_to_users.rb
class AddDeviseToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      # Only add the columns if they don't already exist
      t.string :email, null: false, default: '' unless column_exists?(:users, :email)
      t.string :encrypted_password, null: false, default: '' unless column_exists?(:users, :encrypted_password)
      t.string :reset_password_token unless column_exists?(:users, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:users, :reset_password_sent_at)
      t.datetime :remember_created_at unless column_exists?(:users, :remember_created_at)

      # Remove these if they cause conflicts
      # t.string :confirmation_token unless column_exists?(:users, :confirmation_token)
      # t.datetime :confirmed_at unless column_exists?(:users, :confirmed_at)
      # t.datetime :confirmation_sent_at unless column_exists?(:users, :confirmation_sent_at)
    end

    # Add indexes if they don't already exist
    add_index :users, :email, unique: true unless index_exists?(:users, :email)
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
  end
end
