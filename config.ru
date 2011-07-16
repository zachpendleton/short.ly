# Load path and gems/bundler
$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
require "rubygems"
require "bundler"
Bundler.require

# Local config
require "config/initializers/database"
RACK_ENV ||= "development"

# Load app
require "app"
run App
