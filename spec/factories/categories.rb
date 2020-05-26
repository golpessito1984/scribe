# frozen_string_literal: true
FactoryBot.define do
  factory :category do
    title { Faker::Job.unique.field }
    description { Faker::Name.name + " description" }
    order { Faker::Number.number(digits: 1) }
    parent_id { nil }
  end
end