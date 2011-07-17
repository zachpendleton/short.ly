# ActiveRecord Configuration
settings = YAML::load_file("config/database.yml")
DB = Sequel.connect(settings[ENV['RACK_ENV']])

# MongoMapper Configuration
# settings = YAML::load_file("config/mongo.yml")
# DB = Mongo::Connection.new
# MongoMapper.database = settings[ENV['RACK_ENV']]["name"]
