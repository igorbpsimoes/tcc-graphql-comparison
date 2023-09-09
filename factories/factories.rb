FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
  end

  factory :tweet do
    content { Faker::Lorem.sentence }
    user { build(:user) }
  end

  factory :comment do
    content { Faker::Lorem.sentence }
    tweet { build(:tweet) }
    user { build(:user) }
  end

  factory :vote do
    user { build(:user) }

    trait :for_comment do
      association :voteable, factory: :comment
    end

    trait :for_tweet do
      association :voteable, factory: :tweet
    end
  end

  factory :user_connection do
    user { build(:user) }
    follower { build(:user) }
  end
end
