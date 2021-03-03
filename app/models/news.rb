class News < ApplicationRecord
  validates  :source_news, :url, :date_publish, :date_crawler, 
             :title, :caption, :body, presence: true
end
