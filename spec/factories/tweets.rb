# frozen_string_literal: true

FactoryBot.define do
  factory :tweet do
    id 1
    title "Test Tweet"
    content "This tweet is made by facrotybot"
    user_id 1
  end
end
