class Admin::Message < ApplicationRecord
  enum direction: [:internal, :in, :out]
  has_rich_text :body
  belongs_to :case

  def sender
    case direction.to_sym
    when :internal
      "internal note"
    when :in
      self.case.intake.name
    when :out
      "admin user"
    end
  end
end

