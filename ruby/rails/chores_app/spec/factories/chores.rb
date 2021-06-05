# frozen_string_literal: true

FactoryBot.define do
  factory :chore do |f|
    f.id { Faker::Number.unique.number(digits: 2) }
    f.job { Faker::Job.field }
    f.description { Faker::Job.title }
    f.child_id { Faker::Number.unique.number(digits: 2) }

    association :child, factory: :child
  end
end
