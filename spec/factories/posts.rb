FactoryGirl.define do
  factory :post do
    content "I'm goint to #moe's"

    trait :with_id do
      id 1
    end

    factory :hoot_with_id, traits: [:with_id]

    trait :with_author do
      user_id 1
    end

    factory :hoot_with_author, traits: [:with_author]
  end
end
