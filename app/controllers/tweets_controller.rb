require 'twitter'

class TweetsController < ApplicationController
  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end

    tweets_xbav = client.user_timeline('xbav_ag', count: 20)
    tweets_github = client.user_timeline('github', count: 20)
    tweets_vuejs = client.user_timeline('vuejs', count: 20)

    @xbav_messages = tweets_xbav.map {|tweet| tweet.full_text}
    @github_messages = tweets_github.map {|tweet| tweet.full_text}
    @vuejs_messages = tweets_vuejs.map {|tweet| tweet.full_text}
  end
end
