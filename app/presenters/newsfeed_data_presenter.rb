class NewsfeedDataPresenter
  def initialize(data)
    @data = data
  end

  def title
    @data['title']
  end

  def description
    @data['description']
  end

  def snippet
    @data['snippet']
  end

  def keywords
    @data['keywords']&.split(',')
  end

  def url
    @data['url']
  end

  def image_url
    @data['image_url']
  end

  def published_at
    @data['published_at']&.to_datetime.strftime('%d %b %Y')
  end

  def similar_news_data
    @data['similar'].inject([]) do |results, similar_news_data|
      results << NewsfeedDataPresenter.new(similar_news_data)
      results
    end
  end
end