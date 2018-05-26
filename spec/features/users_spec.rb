# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Users", type: :feature do
  # 認証なし
  # サインアップする
  scenario "user signs up" do
    visit new_user_registration_path
    expect {
      fill_in "Name", with: "testuser"
      fill_in "Eメール", with: "test@example.com"
      fill_in "パスワード", with: "test-password"
      fill_in "パスワード（確認用）", with: "test-password"
      click_button "Sign up"
    }.to change(User, :count).by(1)
  end

  # サインインする
  scenario "user signs in" do
    user = FactoryBot.build(:user)
    visit new_user_session_path
    fill_in "Eメール", with: "testuser@example.com"
    fill_in "パスワード", with: "testpassword"
    click_button "Sign in"
    expect(page).to have_content "Test User"
  end

  # 認証あり
  # サインインする
  scenario "user signs in with Twitter's API" do
    OmniAuth.config.mock_auth[:twitter] = nil
    Rails.application.env_config["omniauth.auth"] = twitter_mock(name: "Twitter User")
    visit new_user_session_path
    click_link "Sign in with Twitter"
    expect(page).to have_content "Twitter User"
  end
end
