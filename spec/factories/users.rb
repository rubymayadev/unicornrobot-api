FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    username {Faker::Team.creature}
    password {'password'}
  end
end
