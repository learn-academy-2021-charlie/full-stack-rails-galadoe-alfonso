class BlogPostController < ApplicationController

  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog1 = BlogPost.find(params[:id])
  end

  #new -- the page with a form
  def new 
   @blog_post = BlogPost.new
  
  end

  #create


  #edit -- the page with a form

  #update


  #destroy


end
