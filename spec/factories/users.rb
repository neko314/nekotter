# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id 1
    name "Test User"
    email "testuser@example.com"
    password "testpassword"
  end
end
