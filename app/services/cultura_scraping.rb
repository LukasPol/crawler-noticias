require "open-uri"
require "nokogiri"

class CulturaScraping
  def initialize(all_pages=false)
    @all_pagas = all_pages
    @web_site = parsed_template('http://cultura.gov.br/categoria/noticias/')
  end

  def scraping
    stop_scraping = false
    source_news = 'Cultura'
    loop do
      @web_site.xpath("//li[starts-with(@id, 'post')]").each do |post|
        title = post.css('div h2 a').first.content
        unless News.find_by(title: title).nil?
          stop_scraping = true
          break
        end
        caption = post.css('div p').first.content
        href = post.css('div h2 a').first['href']
        body = scraping_body(href)
        span = post.css('div span.details').first.content
        date_publish =  span.split(',').second.split('em ').last
        News.create(title: title, caption: caption, source_news: source_news,
                    body: body, url: href, date_publish: date_publish,
                    date_crawler: DateTime.now)
      end

      break if @web_site.xpath("//a[text()='Próxima']/@href").blank? || stop_scraping

      @web_site = parsed_template(@web_site.xpath("//a[text()='Próxima']/@href").first.value)    
    end
  end

  def scraping_body(url)
    news_page = parsed_template(url)
    body = ""
    article = news_page.css('article div.entry-content p').each do |paragraph|
      body << paragraph
      body << "<br>"
    end
  end

  private
    def parsed_template(url)
      return Nokogiri::HTML(URI.open(url), nil, Encoding::UTF_8.to_s)
    end
end
