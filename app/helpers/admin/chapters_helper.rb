require 'open-uri'
require 'iconv'
module Admin::ChaptersHelper
  def format_source_url(source_url, chapter)
    number = chapter.number
    if number < 10
      flag = '00' + number.to_s
    elsif number < 100
      flag = '0' + number.to_s
    else
      flag = number.to_s
    end

    source_url.gsub('@', flag)
  end

  def spider_url(url)
    #Iconv.iconv("UTF-8//IGNORE","GB2312//IGNORE",open(url, 'Accept-Language'=>'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3').read)
    Iconv.new("UTF-8//IGNORE","GB2312//IGNORE").iconv(open(url, 'Accept-Language'=>'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3').read)
  end
end
