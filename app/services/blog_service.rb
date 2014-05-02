class BlogService
  attr_accessor :blog_type
  def initialize url
    @url = url
    @domain = nil
    @blog_type = nil
    detect_blog_type
  end

  def detect_blog_type
    hostname = URI.parse(@url).host.downcase
    if(hostname[".wordpress."])
      @blog_type = "wordpress"
    elsif(hostname[".blogger."])
      @blog_type = "blogger"
    end
    @domain = URI.parse(@url).scheme + "://" + hostname
  end

  def title_list
    if @blog_type == "wordpress"
      Wordpress.new(@domain).title_list
    end
  end
end
