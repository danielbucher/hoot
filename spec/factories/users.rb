FactoryGirl.define do
  factory :user, aliases: [:author] do
    id 1
    name "Homer Simpson"
    email "homer@iloveduff.com"
    password "thisisastrongpassword"
    username "homer"
    bio "Just a guy that likes beer and pizza."
  end

end
