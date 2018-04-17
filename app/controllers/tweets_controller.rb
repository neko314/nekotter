class TweetsController < ApplicationController
  def index
    @tweets = Tweet.page(params[:page]).per(2)
  end

  def show
  end

  def new
  end

  def create
    @tweet = Tweet.create(params[:tweet_params])
    redirect_to '/tweets/index'
  end

  private

    def tweet_params
      params.require(:tweet).permit(:title, :content)
    end
end
