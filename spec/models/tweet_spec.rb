require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe "create" do
    it "is valid with a title and a content" do
      tweet = Tweet.new(
        title:   "Test title",
        content: "Test content",
      )
      expect(tweet).to be_valid
    end

    it "is invalid without a title" do
      tweet = Tweet.new(title: nil)
      expect(tweet).to be_invalid include("can't be blank")
    end

    it "is invalid without a content" do
      tweet = Tweet.new(content: nil)
      expect(tweet).to be_invalid
    end

    it "is invalid with a title wich has more 20characters"do
      tweet = Tweet.new(title: "a" * 21, content: "content")
      expect(tweet).to be_invalid
    end

    it "is invalid with a content wich has more 200characters" do
      tweet = Tweet.new(title:"Title", content: "a"* 201)
      expect(tweet).to be_invalid
    end

  end
end
