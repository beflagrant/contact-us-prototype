class AddTokenToAdminCase < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_cases, :token, :string
    Admin::Case.all.each { |c| c.update(token: SecureRandom.urlsafe_base64(10)) }
    change_column :admin_cases, :token, :string, null: false
  end
end
