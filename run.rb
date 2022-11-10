require 'rubygems'
require 'bundler/setup'

require 'figaro'

require_relative 'twitter_client.rb'

# SETUP ENVS
Figaro.application = Figaro::Application.new(
  environment: ENV['ENVIROMENT'],
  path: File.expand_path('config/application.yml')
)
Figaro.load

twitter = TwitterClient.new(
    ENV['CONSUMER_KEY'],
    ENV['CONSUMER_SECRET'],
    ENV['ACCESS_TOKEN'],
    ENV['ACCESS_TOKEN_SECRET'],
    ENV['TOKEN']
  )

twitter.fav_by_username "mariovzc"
#p twitter.get_by_username("mariovzc")



