# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test#{n}" }
    sequence(:email) { |n| "test#{n}@test.com" }
    password { 'testtest' }
  end
end
