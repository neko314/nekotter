# frozen_string_literal: true

class RemoveUsernameAndAboutFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :username
    remove_column :users, :about
  end
end
