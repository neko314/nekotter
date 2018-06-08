# frozen_string_literal: true

class Users::RegistrarionsController < Devise::RegistrationsController
  def build_resource(hash = nil)
    hash[:uid] = User.create_unique_string
    super
  end
end
