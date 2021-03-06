class Admin::Message < ApplicationRecord
  enum direction: %i[internal in out]
  has_rich_text :body
  belongs_to :case

  def sender
    return 'internal note' if internal?
    return self.case.intake.name if in?
    return 'admin user' if out?
  end

  private

  def editable?
    internal?
  end
end
