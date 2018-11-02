FactoryBot.define do
  factory :user do
    email { "djain@bestpe.com" }
    password { "000000" }
    password_confirmation { "000000" }
    avatar { nil }
  
    after(:build)   { |user| user.skip_confirmation_notification! }
    # skip_confirmation!
    # skip_confirmation true
  end
end