# Sequel Configuration
settings = YAML::load_file("config/db.yml")
DB = Sequel.connect(ENV['SHARED_DATABASE_URL'] || settings[ENV['RACK_ENV']])

# MongoMapper Configuration
# settings = YAML::load_file("config/mongo.yml")
# DB = Mongo::Connection.new
# MongoMapper.database = settings[ENV['RACK_ENV']]["name"]
