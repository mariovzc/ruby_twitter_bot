require "twitter"
require "logger"


class TwitterClient

  def initialize(consumer_key, consumer_secret, access_token, access_token_secret, token)
    @token = token
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = consumer_key
      config.consumer_secret     = consumer_secret
      config.access_token        = access_token
      config.access_token_secret = access_token_secret
    end
  end

  def fav_by_username(username)
    tweets = @client.user_timeline(username)
    # require 'pry'; binding.pry
    tweets.each_with_index do | tw, index |
      @client.favorite(tw) unless tw.retweeted_tweet? or tw.reply?
    end
  end

  def retweet_by_username(username)

    tweets = @client.user_timeline(username)
    require 'pry'; binding.pry
    tweets.each_with_index do | tw, index |
      @client.retweet(tw) unless tw.retweeted_tweet? or tw.reply?

      break if index == 10
    end
  end
end
