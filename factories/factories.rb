FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
  end

  factory :tweet do
    content { Faker::Lorem.sentence }
    association :author, factory: :user
  end

  factory :comment do
    content { Faker::Lorem.sentence }
    association :user
    association :tweet
  end

  factory :vote do
    association :user
    association :voteable, factory: :tweet
  end

  factory :user_connection do
    association :user
    association :follower, factory: :user
  end
end
