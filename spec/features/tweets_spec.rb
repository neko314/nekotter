# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Tweets", type: :feature do
  context "when a user is authenticated" do
    before do
      @user = FactoryBot.build(:user)
    end
    # ユーザーは新しいツイートを投稿する.
    scenario "user ceates a new tweet" do
      visit new_user_session_path
      fill_in "Eメール", with: @user.email
      fill_in "パスワード", with: @user.password
      click_button "Sign in"
      expect {
        click_link "New Tweet"
        fill_in "Title", with: "New Tweet"
        fill_in "Content", with: "New Content"
        click_button "Submit"
      }.to change(@user.tweets, :count).by(1)
    end

    # ユーザーはツイートを更新する.
    scenario "user updates a tweet" do
      tweet = FactoryBot.create(:tweet)
      visit "tweets/show"
      click_link "Edit"
      fill_in "Title", with: "New Title"
      click_button "Submit Tweet"
      visit tweet_path(tweet)
      expect(tweet.title).to eq "New Title"
    end

    # ユーザーはツイートを削除する.
    scenario "user deletes a tweet" do
    tweet = FactoryBot.create(:tweet)
    visit "tweets/show"
    expect{
      click_link "Destroy"
    }.to change(@user.tweets, :count).by(-1)
    end
  end

  # 許可されていないユーザーの場合.
  context "when a user isn't authenticated" do
  end

end
