FactoryGirl.define do
  factory :user, aliases: [:author] do
    name "Example User"
    email "exampleuser@gmail.com"
    password "foobarwazzup"
    password_confirmation "foobarwazzup"
  end

  factory :post do
    author
    title "Need a producer"
    content "Bacon ipsum dolor sit amet voluptate kielbasa frankfurter cow"
    flagged false
  end
end
