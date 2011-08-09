namespace :db do
  desc "Run all migrations in db/migrate"
  task :migrate => :connect do
    Sequel.extension(:migration)
    Sequel::Migrator.apply(DB, "db/migrate")
  end

  task :connect => :environment do
    settings    = YAML::load_file("config/database.yml")
    environment = ENV['RACK_ENV'] || "development"
    DB          = Sequel.connect(ENV['DATABASE_URL'] || settings[environment])
  end
end

task :environment do
  require "rubygems"
  require "bundler"
  Bundler.require
end
