# frozen_string_literal: true

FactoryBot.define do
  factory :blog do
    sequence(:title) { |n| "title#{n}" }
    text { 'text' }
  end
end
