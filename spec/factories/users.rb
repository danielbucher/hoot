FactoryGirl.define do
  factory :user, aliases: [:author] do
    id 1
    name "Homer Simpson"
    email "homer@iloveduff.com"
    password "thisisastrongpassword"
    username "homer"
    bio "Just a guy that likes beer and pizza."
  end

  factory :moe, class: 'User' do
    id 2
    name "Moe"
    email "moe@iloveduff.com"
    password "thisisastrongpassword"
    username "moe"
    bio "Come drink at Moe's"
  end

end
