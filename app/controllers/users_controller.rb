# frozen_string_literal: true

class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find_by(username: params[:username])
    unless @user
      redirect_to "/users/sign_in"
    end
  end
end
