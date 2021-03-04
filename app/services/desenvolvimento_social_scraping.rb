require "open-uri"
require "nokogiri"

class DesenvolvimentoSocialScraping
  def initialize(all_pages=false)
    @all_pagas = all_pages
    @web_site = parsed_template('https://www.gov.br/cidadania/pt-br/noticias-e-conteudos/desenvolvimento-social/noticias-desenvolvimento-social')
  end

  def scraping
    stop_scraping = false
    loop do
      @web_site.css('div#content-core article').each do |article|
        title = article.css('div.tileContent h2 a').first.content
        unless News.find_by(title: title).nil?
          stop_scraping = true
          break
        end
        scraping_news(article.css('div.tileContent h2 a').first['href'])
      end

      break if @web_site.css("a.proximo").blank? || stop_scraping
      web_site = parsed_template(@web_site.css("a.proximo").first['href'])
    end
  end

  def scraping_news(url)
    source_news = 'Desenvolvimento Social'
    news = parsed_template(url)
    title = news.css('article h1').first.text
    caption = news.css('article div.documentDescription').first.text
    date_publish = news.css('article div#viewlet-above-content-body div#plone-document-byline span.documentPublished span.value').first.text
    body = ""
    news.css('article div#content-core div#parent-fieldname-text div p').each do |paragraph|
      body << paragraph.text
      body << '<br/>'
    end

    tags = ''
    news.css('div#category span a').each do |tag|
      tags << tag.text
      tags << ' / '
    end

    News.create(title: title, caption: caption, source_news: source_news,
                body: body, url: url, tags: tags, date_publish: date_publish,
                date_crawler: DateTime.now)
  end

  private
    def parsed_template(url)
      return Nokogiri::HTML(URI.open(url), nil, Encoding::UTF_8.to_s)
    end
end