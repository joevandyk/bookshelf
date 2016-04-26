require 'rubygems'
require 'bundler/setup'
require 'hanami/setup'
require_relative '../lib/bookshelf'
require_relative '../apps/channel_advisor/application'
require_relative '../apps/web/application'

Hanami::Container.configure do
  mount ChannelAdvisor::Application, at: '/channel_advisor'
  mount Web::Application, at: '/'
end
