FactoryBot.define do
  factory :admin_case, class: Admin::Case do
    intake { create :intake }
  end
end
