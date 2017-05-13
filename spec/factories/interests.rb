FactoryGirl.define do
  factory :interest do
    description {Faker::HarryPotter.character}
    user_id nil
  end
end
