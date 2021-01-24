FactoryBot.define do
  factory :schedule do
    start_date  { Faker::Date.forward(days: 30) }
    end_date    { start_date }
    client      { Faker::Company.name }
    title       { '今日の番組' }
    content     { Faker::Lorem.sentence }
    association :user
  end
end
