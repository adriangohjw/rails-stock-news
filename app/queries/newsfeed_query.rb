API_TOKEN = ENV['NEWS_API_KEY']
API_TOKEN = 'VAIjb4j72hpDrcPPykzlMvSoEfbVyfbZvI2UwaN5'

class NewsfeedQuery
  API_ENDPOINT = "https://api.marketaux.com/v1/news/all?api_token=#{API_TOKEN}&language=en"

  def initialize(symbols: '', sentiment: '', search: '')
    @symbols = symbols
    @sentiment = sentiment
    @search = search
  end

  def call
    HTTParty.get(build_query)
  end

  private

  def build_query
    query = API_ENDPOINT
    query += "&symbols=#{@symbols}" if @symbols.present?
    query += sentiment_query_builder if @sentiment.present?
    query += "&search=#{@search}" if @search.present?
    query
  end

  def sentiment_query_builder
    case @sentiment
    when Sentiment::OPTION_VERY_POSITIVE
      '&sentiment_gte=0.5'
    when Sentiment::OPTION_POSITIVE
      '&sentiment_gte=0.001&sentiment_lte=0.499'
    when Sentiment::OPTION_NEUTRAL
      '&sentiment_gte=0&sentiment_lte=0'
    when Sentiment::OPTION_NEGATIVE
      '&sentiment_gte=-0.499&sentiment_lte=-0.001'
    when Sentiment::OPTION_VERY_NEGATIVE
      '&sentiment_lte=0.5'
    end
  end
end