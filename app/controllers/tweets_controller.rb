require 'twitter'

class TweetsController < ApplicationController
  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "kxTYZydGQqeTrwHACIyh3EBUY"
      config.consumer_secret     = "j5SovH5VuaQ8kjjbX0KEgp3LQJ2oHgpJQmeQd6HxtgKTB4lEpV"
      config.access_token        = "390236231-wGxbj8OWhxwTbgiQPp9RzqJNbQKvL9rlcJvKnNyz"
      config.access_token_secret = "TvZic1K4KeTnYIABAXN7YKNQWypajl3KhIoS4S6Dushtu"
    end

    tweets_xbav = client.user_timeline('xbav_ag', count: 20)
    tweets_github = client.user_timeline('github', count: 20)
    tweets_vuejs = client.user_timeline('vuejs', count: 20)

    @xbav_messages = tweets_xbav.map {|tweet| tweet.full_text}
    @github_messages = tweets_github.map {|tweet| tweet.full_text}
    @vuejs_messages = tweets_vuejs.map {|tweet| tweet.full_text}
  end
end
