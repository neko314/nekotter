# frozen_string_literal: true

class Tweet < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 200 }
  belongs_to :user, foreign_key: "user_id"
end
