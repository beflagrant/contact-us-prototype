# frozen_string_literal: true

class DeviseCreateAdminUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :full_name
      t.string :uid
      t.string :avatar_url

      t.timestamps null: false
    end

    add_index :admin_users, :email,                unique: true
  end
end
