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
  def create
    @blog_post = BlogPost.create(blog_post_params)
    #checking to see if the post is valid
    if @blog_post.valid?
      redirect_to root_path
    else
      redirect_to blog_new_path
    end
  end


  #edit -- the page with a form

  #update


  #destroy
  def blog_post_params
    params.require(:blog_post).permit(:title, :content)
  end

end
