json.extract! news, :id, :source_news, :url, :body, :date_publish, :date_crawler, :tags, :title, :caption, :created_at, :updated_at
json.url news_url(news, format: :json)
