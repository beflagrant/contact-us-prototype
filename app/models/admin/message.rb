class Admin::Message < ApplicationRecord
  enum direction: [:internal, :in, :out]
  has_rich_text :body
  belongs_to :case
end

