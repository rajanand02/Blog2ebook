class BlogListController < ApplicationController
  def index
  end

  def search
    if params[:url]
      @links = BlogService.new(params[:url]).title_list
    end
    render :layout => false
  end
end
