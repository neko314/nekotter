# frozen_string_literal: true

class TweetsController < ApplicationController
  def index
    @tweets = Tweet.page(params[:page]).per(2)
  end

  def show
    @tweet = Tweet.find_by(params[:user_id])
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


  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])

    if @tweet.update(tweet_params)
      redirect_to @tweet
    else
      render 'edit'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path
  end

  private

    def tweet_params
      params.require(:tweet).permit(:title, :content, :user_id)
    end
end
