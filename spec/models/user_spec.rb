# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
    describe ".from_omniauth" do
        before do
          user = User.create(
            name: "TestUser",
            email: "testuser@example.com",
            provider: "twitter",
            password: "testpassword"
          )
        end

        context "when a match is found" do
          it "authenticate an user" do
            user = User.where(provider: "twitter").first
            expect(user.name).to eq ("TestUser")
          end
        end

        context "when no match is found" do
            it "create an user through Twitter's API" do
              user = User.create(
                name: "OtherUser",
                provider: "twitter",
                password: "otherpassword"
                )
              expect(user.email).to be_empty
            end

            it "returns a dummy email" do
              email = User.create_unique_email
              expect(email).to be_end_with("@example.com")
            end

          end
      end

      it "has a valid factory" do
        expect(FactoryBot.build(:user)).to be_valid
      end
  end
