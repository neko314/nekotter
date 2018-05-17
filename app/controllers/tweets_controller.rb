# frozen_string_literal: true

class TweetsController < ApplicationController
  def index
    @tweets = Tweet.page(params[:page]).per(2)
  end

  def show
  end

  def new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to "/tweets"
    else
      redirect_to "/tweets/new"
    end
  end

  private

    def tweet_params
      params.require(:tweet).permit(:title, :content, :user_id)
    end
end
