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
root 'blog_post#index' (links to the index page)
```

in view:

```

```

- As a user, I can click on the title of a blog and be routed to a page where I see the title and content of the blog post I selected.
  **First we create a show view**

in the blog_post controller, create a show method

```ruby
def show
  @blog1 = BlogPost.find(params[:id])
end

```

in the index view, we link it to the pages

```ruby
<li><%=link_to blog_post.title, blog_post_path(blog_post)%></li>
```

in the show view, we displayed the title and the content

```ruby
<h1><%=@blog_post.title%></h1>
<p><%=@blog_post.content%></p>
```

- As a user, I can navigate from the show page back to the home page.
  we found two ways to do it.

**Method one:**

in show.html.erb view

```ruby
 <%= link_to "text for link", root_path %>
```

**Method two:**

in routes.rb

```ruby
get '/blog_posts' => "blog_post#index", as: 'blog_posts'
#add an alias called blog_posts
```

in show.html.erb view

```ruby
 <%= link_to "text for link", blog_posts_path %>
```

- As a user, I see a form where I can create a new blog post.
  in routes.rb

```ruby
  #this is the new route
  get 'blog_posts/new' => 'blog_post#new'
```

in our controler:

```ruby
 def new
  @blog_post = BlogPost.new
 end
```

in the new view:

```ruby
<h1>Create a New Blog Post </h1>

<%= form_with model: @blog_post, local: true do |form|  %>
<%= form.label :title %>
<%= form.text_field :title %>
<br>
<br>
<%= form.label :content %>
<%= form.text_area :content %>
<br>
<br>
<%= form.submit 'Add Post' %>

<% end %>

```

- As a user, I can click a button that will take me from the home page to a page where I can create a blog post.
  in the route

```ruby
get '/blog_post' => "blog_post#new", as: 'blog_new'
```

in the new view

```ruby
<p><%=link_to "Main Post", root_path%></p>
```

in the controller create an new method

```ruby
def new
  @blog_post = BlogPost.new
end
```

- As a user, I can navigate from the form back to the home page.
  in the new view

```ruby
<p><%=link_to "Main Post", root_path%></p>
```

- As a user, I can click a button that will submit my blog post to the database.
  in the controller

```ruby
def create
  @blog_post = BlogPost.create(blog_post_params)
  #checking to see if the post is valid
  if @blog_post.valid?
    redirect_to root_path
  else
    redirect_to blog_new_path
  end
end
```

##it allows on title and content as parameter##

```ruby
def blog_post_params
  params.require(:blog_post).permit(:title, :content)
end
```

in the route

```ruby
post '/blog_posts' => "blog_post#create", as: 'blog_create'
```

- As a user, I when I submit my post, I am redirected to the home page.
  in our create method, we check to see if the object is valid. If it is, we use `redirect_to` to go to the main page.

### Stretch Challenges

- As a user, I can delete my blog post.
  - in the show view, we want a link to delete
  ```ruby
  <p>
    <%= link_to "Delete Post", delete_blog_post_path(@blog1), method: :delete %>
  </p>
  ```
  - in controller, create #destroy method.
  ```ruby
    def destroy
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.destroy
      redirect_to root_path
    else
      redirect_to blog_post_path(@blog_post)
    end
  end
  ```
  - link will go to destroy path THEN redirect to main page
- As a user, I can update my blog post.

  - controller -> create a method #edit

    ```ruby
    def edit
      @blog_post = BlogPost.find(params[:id])
    end
    ```

    ```ruby
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

    ```

  - in router -> create a path to edit (which will show the user a form)
    `get '/blog_posts/:id/edit' => 'blog_post#edit', as: 'edit_blog_post'`
  - create a view with that form
    we copied the form from the new view. we added `method: :patch`

- As a developer, I can ensure that all blog posts have titles and content for each post.
in the model
```ruby
validates :title, :content, presence:true
```
- As a developer, I can ensure that all blog post titles are unique.
in the model
```ruby
validates :title, uniqueness:true
```
- As a developer, I can ensure that blog post titles are at least 10 characters.
in the model
```ruby
validates :title, length: {minimum: 10}
```

### The link_to Method

link_to needs at least 2 things:

- the text that will show on the link
- the path that the link will take the user to

```ruby
  link_to "text the link will have", the_path
```
