class Admin::Case < ApplicationRecord
  include AASM

  aasm do
    state :new, initial: true
    state :reviewed, :responded, :closed

    event :review do
      transitions from: :new, to: :reviewed
    end

    event :respond do
      transitions from: :reviewed, to: :responded
      transitions from: :responded, to: :responded
    end

    event :close do
      transitions from: :reviewed, to: :closed
      transitions from: :responded, to: :closed
    end
  end

  belongs_to :intake
  has_many :messages
end
