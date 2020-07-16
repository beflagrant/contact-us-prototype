class AddIntake < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto'

    create_table :intakes, id: :uuid do |t|
      t.string :name, null: false
      t.string :email, index: true
      t.text :message

      t.timestamps
    end
  end
end
