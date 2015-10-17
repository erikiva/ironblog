require 'date'
require 'colorize'
require 'pry'
require_relative 'post.rb'
require_relative 'blog.rb'


blog = Blog.new 4

blog.add_post Post.new("Post title 1", DateTime.now, "Post 1 text")
blog.add_post Post.new("Post title 2", DateTime.now,  "Post 2 text", true)
blog.add_post Post.new("Post title 3", DateTime.now,  "Post 3 text")
blog.add_post Post.new("Post title 4", DateTime.now,  "Post 4 text")
blog.add_post Post.new("Post title 5", DateTime.now,  "Post 5 text", true)
blog.add_post Post.new("Post title 6", DateTime.now,  "Post 6 text")
blog.add_post Post.new("Post title 7", DateTime.now,  "Post 7 text")
blog.add_post Post.new("Post title 8", DateTime.now,  "Post 8 text")
blog.add_post Post.new("Post title 9", DateTime.now,  "Post 9 text")

blog.publish_front_page
