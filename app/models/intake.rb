class Intake < ApplicationRecord
  has_one :case

  after_create :ensure_case

private
  def ensure_case
    Admin::Case.find_or_create_by!(intake_id: id)
  end

end
