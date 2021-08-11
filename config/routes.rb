Rails.application.routes.draw do
  resources :fruits
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

  delete '/blog_posts/:id' => 'blog_post#destroy', as: 'delete_blog_post'

  get '/blog_posts/:id/edit' => 'blog_post#edit', as: 'edit_blog_post'

  patch 'blog_posts/:id' => 'blog_post#update'
end
