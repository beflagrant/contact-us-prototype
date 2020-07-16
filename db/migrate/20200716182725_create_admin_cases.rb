class CreateAdminCases < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_cases, id: :uuid do |t|
      t.uuid :intake_id, foreign_key: true
      t.string :aasm_state

      t.timestamps
    end

    create_table :admin_messages, id: :uuid do |t|
      t.uuid :case_id, foreign_key: true
      t.integer :direction, default: 0

      t.timestamps
    end
  end
end
