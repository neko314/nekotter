# frozen_string_literal: true

class RemoveLocationFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :location
  end
end
