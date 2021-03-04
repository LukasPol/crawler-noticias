class NewsController < ApplicationController
  before_action :set_news, only: %i[ show ]

  # GET /news
  def index
    @news = News.all
    CulturaScraping.new().scraping()
    DesenvolvimentoSocialScraping.new().scraping()
  end

  # GET /news/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end
end
