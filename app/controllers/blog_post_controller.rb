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
  def edit 
    @blog_post = BlogPost.find(params[:id])
  end


  #update
  def update 
    #find the blog we want to update
    @blog_post = BlogPost.find(params[:id])
    #update blog
    
    #redirect to main page
    if @blog_post.update(blog_post_params)
      redirect_to root_path
    else
      redirect_to blog_posts
    end
  end

  #destroy
  def destroy
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.destroy
      redirect_to root_path
    else
      redirect_to blog_post_path(@blog_post)
    end
  end



  private
  def blog_post_params
    params.require(:blog_post).permit(:title, :content)
  end

end
