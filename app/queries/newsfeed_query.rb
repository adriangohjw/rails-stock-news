API_TOKEN = ENV['NEWS_API_KEY']

class NewsfeedQuery
  API_ENDPOINT = "https://api.marketaux.com/v1/news/all?api_token=#{API_TOKEN}&language=en"

  def initialize(search: '')
    @search = search
  end

  def call
    HTTParty.get(build_query)
  end

  private

  def build_query
    query = API_ENDPOINT
    query += "&search=#{@search}" if @search.present?
    query
  end
end