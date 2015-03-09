FactoryGirl.define do
  factory :post do
    content "I'm goint to #moe's"

    trait :with_author do
      user_id 1
    end

    factory :hoot_with_author, traits: [:with_author]
  end

  factory :another_post, class: Post do
    content "D'oh!"

    trait :with_author do
      user_id 1
    end

    factory :another_hoot_with_author, traits: [:with_author]
  end
end
