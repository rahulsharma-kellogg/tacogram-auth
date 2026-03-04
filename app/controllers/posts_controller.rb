class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
  end
  
  def create
    @user = User.find_by({"id" => session["user_id"]})
    @post = Post.new
    @post["body"] = params["body"]
    @post["image"] = params["image"]
    @post["user_id"] = @user["id"]
    @post.save
    redirect_to "/posts"
  end
end
