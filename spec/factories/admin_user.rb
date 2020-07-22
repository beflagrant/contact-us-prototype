FactoryBot.define do
  factory :admin_user, class: AdminUser do
    email { "admin@flagrant.dev" }
    full_name { "Grant Fla" }
  end
end
