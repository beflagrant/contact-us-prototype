class Intake < ApplicationRecord
  has_one :case, class_name: "Admin::Case"

  after_create :ensure_case

  def sender
    "#{name} (#{email})"
  end

  private

  def ensure_case
    Admin::Case.find_or_create_by!(intake_id: id)
  end
end
