class NewsController < ApplicationController
  # GET /news
  def index
    CulturaScraping.new().scraping()
    DesenvolvimentoSocialScraping.new().scraping()
    @news = News.all.paginate(page: params[:page], per_page: 5)
  end
end
