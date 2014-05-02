class BlogListController < ApplicationController
  def index
    if params[:url]
      @links = BlogService.new(params[:url]).get_links
    end
  end
end
