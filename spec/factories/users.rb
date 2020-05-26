# frozen_string_literal: true
FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    name { Faker::Name.name }
    surname { Faker::Number.unique.number(digits: 1) }
    password { '918912178' }
  end
end