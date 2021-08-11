Rails.application.routes.draw do
  #homepage
  root 'blog_post#index'
  #This is the index route
  get '/blog_posts' => "blog_post#index"

  #This is the show route
  get '/blog_posts/:id' => 'blog_post#show', as: 'blog_post'
  # root ''
end
