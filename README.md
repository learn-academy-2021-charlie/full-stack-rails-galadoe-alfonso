### Challenges

As a developer, I have been commissioned to create an application where a user can see and create blog posts.

- As a developer, I can create a full-stack Rails application.

```
rails new blog -d postgresql -T
```

- As a developer, my blog post can have a title and content.

```
 rails g model BlogPost title:string content:string
```

- As a developer, I can add new blog posts directly to my database.
- As a user, I can see all the blog titles listed on the home page of the application.
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
