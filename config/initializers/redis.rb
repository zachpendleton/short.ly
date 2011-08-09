if ENV['REDISTOGO_URL']
  require "uri"
  uri = URI.parse(ENV['REDISTOGO_URL'])
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
else
  settings = YAML::load_file("config/redis.yml")
  REDIS = Redis.new(settings[ENV['RACK_ENV']])
end

