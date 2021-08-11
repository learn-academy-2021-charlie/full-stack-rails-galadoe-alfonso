Rails.application.routes.draw do
  #homepage
  root 'blog_post#index'
  #This is the index route
  get '/blog_posts' => "blog_post#index", as: 'blog_posts'

  get '/blog_posts/new' => 'blog_post#new'

  #This is the show route
  get '/blog_posts/:id' => 'blog_post#show', as: 'blog_post'
  # root ''

  get '/blog_post' => "blog_post#new", as: 'blog_new'

  post '/blog_posts' => "blog_post#create", as: 'blog_create'



end
