class Wordpress
  def initialize url
    @url = url+"/feed"
  end

  def title_list
    Nokogiri::XML(open(@url)).search("item link").collect { |link| link.text }
  end

end
