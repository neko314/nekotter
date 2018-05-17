# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Tweets", type: :feature do
  # 許可されたユーザーの場合.
  scenario "user ceates a new tweet" do
    user = FactoryBot.build(:user)
    visit new_user_session_path
    fill_in "Eメール", with: user.email
    fill_in "パスワード", with: user.password
    click_button "Sign in"

    expect {
      click_link "New Tweet"
      fill_in "Title", with: "New Tweet"
      fill_in "Content", with: "New Content"
      click_button "Submit"
    }.to change(user.tweets, :count).by(1)
    end

  end
  # ユーザーは新しいツイートを投稿する.
  # ユーザーはツイートを更新する.
  # ユーザーはツイートを削除する.

  # 許可されていないユーザーの場合.
  # .
  # .
