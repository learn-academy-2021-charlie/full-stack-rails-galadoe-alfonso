class BlogPostController < ApplicationController

  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog1 = BlogPost.find(params[:id])
  end


end
