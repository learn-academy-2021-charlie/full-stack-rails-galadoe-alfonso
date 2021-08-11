### Challenges

As a developer, I have been commissioned to create an application where a user can see and create blog posts.

- As a developer, I can create a full-stack Rails application.

```
rails new blog -d postgresql -T
rails db:create
```

- As a developer, my blog post can have a title and content.

```
 rails g model BlogPost title:string content:string
 rails db:migrate
```

- As a developer, I can add new blog posts directly to my database.
  - in the console:

```ruby
  BlogPost.create title:"Technology", content: "This is our blog post about technology!"
  BlogPost.create title:"Music", content: "This is our second blog post. It's about music!"
  BlogPost.create title:"Space", content: "ooooh! Space stuff!"

```

- As a user, I can see all the blog titles listed on the home page of the application.
  
  **FIRST CREATE CONTROLLER FOR MODEL**
  
  in controller:

```ruby
def index
    @blog_posts = BlogPost.all
  end
```

in routes.rb:

```ruby
get '/blog_posts' => "blog_post#index"
```

in view:

```

```

- As a user, I can click on the title of a blog and be routed to a page where I see the title and content of the blog post I selected.
- As a user, I can navigate from the show page back to the home page.
- As a user, I see a form where I can create a new blog post.
- As a user, I can click a button that will take me from the home page to a page where I can create a blog post.
- As a user, I can navigate from the form back to the home page.
- As a user, I can click a button that will submit my blog post to the database.
- As a user, I when I submit my post, I am redirected to the home page.

### Stretch Challenges

- As a user, I can delete my blog post.
- As a user, I can update my blog post.
- As a developer, I can ensure that all blog posts have titles and content for each post.
- As a developer, I can ensure that all blog post titles are unique.
- As a developer, I can ensure that blog post titles are at least 10 characters.
