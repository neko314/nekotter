# frozen_string_literal: true

class AddTweetToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :tweet, foreign_key: true
  end
end
