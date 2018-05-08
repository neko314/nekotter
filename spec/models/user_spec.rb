require 'rails_helper'

RSpec.describe User, type: :model do
  describe "signing_up" do
    it "is valid with name, email, password" do
      user = User.create(
        name:     "Testuser",
        email:    "testuser@example.com",
        password: "testpassword",
      )
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = User.new(
        name:     nil,
        email:    "testuser@example.com",
        password: "testpassword",)
      expect(user).to be_invalid include("can't be blank")
    end

    it "is invalid without an email address" do
      user = User.new(
        name:     "Testuser",
        email:    nil,
        password: "testpassword",)
      expect(user).to be_invalid
    end

    it "is invalid without a deplicate email address" do
      user = User.create(
        name:     "Testuser",
        email:    "testuser@example.com",
        password: "testpassword",
      )

      other_user = User.new(
        name:     "Otheruser",
        email:    "testuser@example.com",
        password: "otherpassword",
      )
      expect(other_user).to be_invalid
    end

    it "is invalid without a password" do
      user = User.new(
        name:     "Testuser",
        email:    "testuser@example.com",
        password: nil)
      expect(user).to be_invalid
    end

    it "is invalid with a password which has less than 6characters" do
      user = User.new(
        name:     "Testuser",
        email:    "testuser@example.com",
        password: "12345")
      expect(user).to be_invalid
    end
  end
end
