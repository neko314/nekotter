# frozen_string_literal: true

OmniAuth.config.test_mode = true
def twitter_mock(name)
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
    provider: "twitter",
    uid: "123456",
    info: {
      name: name,
      }
      )
end
OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
# OmniAuth.config.on_failure = Proc.new { |env|
#   OmniAuth::FailureEndpoint.new(env).redirect_to_failure
#   }
