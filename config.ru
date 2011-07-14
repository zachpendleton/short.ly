$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require "rubygems"
require "bundler"

Bundler.require

require "app"
run App
