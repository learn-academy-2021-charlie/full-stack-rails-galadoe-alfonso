Rails.application.routes.draw do
  get '/blog_posts' => "blog_post#index"
  # root ''
end
