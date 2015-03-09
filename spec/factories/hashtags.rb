FactoryGirl.define do
  factory :hashtag do
    content "#moes"
  end

  factory :another_hashtag, class: Hashtag do
    content "#duff"
  end

  factory :yet_another_hashtag, class: Hashtag do
    content "#jesuischarles"
  end
end
