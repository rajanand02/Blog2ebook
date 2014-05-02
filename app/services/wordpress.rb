class Wordpress
  def initialize url
    @url = "https://public-api.wordpress.com/rest/v1/sites/#{url}/posts"
  end

  def title_list
    posts_result = []
    puts @url
    json_page = Net::HTTP.get_response(URI.parse(@url))
    found_count = JSON.parse(json_page.body)["found"]
    if(found_count)
     (1..(found_count/20+1)).each do |page|
        puts page.to_s
        posts = Net::HTTP.get_response URI.parse(@url+"?page="+page.to_s)
        posts = JSON.parse(posts.body)
        if(posts["posts"])
          posts = posts["posts"].map { |h| h.slice("URL", "title") }
          posts_result += posts
        end
      end
    end
    posts_result
  end

end
