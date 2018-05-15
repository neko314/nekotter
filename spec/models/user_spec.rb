# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do

  describe ".create_unique_email" do
    it "returns a dummy email" do
      email = User.create_unique_email
      expect(email).to be_end_with("@example.com")
    end
  end
end
