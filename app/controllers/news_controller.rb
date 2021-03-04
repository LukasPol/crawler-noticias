class NewsController < ApplicationController
  # GET /news
  def index
    CulturaScraping.new().scraping()
    DesenvolvimentoSocialScraping.new().scraping()
    @q = News.ransack(params[:q])
    @news = @q.result(distinct: true).paginate(page: params[:page], per_page: 20)
  end
end
