# frozen_string_literal: true

class Users::ResistrarionsController < Devise::ResistrationsController
  def build_resource(hash = nil)
    hash[:uid] = User.create_unique_string
    super
  end
end
