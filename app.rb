class App < Sinatra::Base
  get "/" do
    @version     = RUBY_VERSION
    @environment = RACK_ENV

    erb :welcome
  end
end
