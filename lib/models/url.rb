class Url < Sequel::Model
  def full_shortened
    "http://#{request.host}/#{shortened}"
  end

  def full_url
    "http://#{original_url}"
  end
end
