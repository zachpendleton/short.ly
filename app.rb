class App < Sinatra::Base

  set :public => "public", :static => true

  helpers do
    def url_link(url)
      "<a href=\"#{url.full_url}\">http://#{request.host}/#{url.shortened}</a>"
    end

    def recent_urls
      REDIS.lrange "recent-links", 0, 5
    end
  end

  get "/" do
    erb :index
  end

  post "/" do
    @url = Url.find_or_create(:original_url => params[:url])
    @url.shortened = @url.id.to_s(36)
    @url.save
    update_cache(url_link(@url))

    erb :index
  end

  get "/:shortened" do
    @url = Url.find(:shortened => params[:shortened])
    redirect @url.nil? ? "/" : @url.full_url
  end

  protected

  def update_cache(link)
    REDIS.lpush("recent-links", link)
    REDIS.rpop("recent-links") if REDIS.llen("recent-links") > 5
  end
end
