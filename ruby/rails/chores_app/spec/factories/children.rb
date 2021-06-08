# frozen_string_literal: true

FactoryBot.define do
  factory :child do |f|
    f.name { Faker::Name.unique.first_name }
    f.age { Faker::Number.number(digits: 1) }
  end
end
