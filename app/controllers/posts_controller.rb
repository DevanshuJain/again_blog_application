class PostsController < ApplicationController
  def edit
    @blog=Blog.find(params[:blog_id])
    @post=@blog.posts.find(params[:id])
  end

  def update
    @blog=Blog.find(params[:blog_id])
    @post=@blog.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to blog_path(@blog)
    else
      render 'edit'
    end
  end

  def show
    @blog=Blog.find(params[:blog_id])
    @post=Post.find(params[:id])
    # @post=@blog.posts.find(params[:id])
    # @comment=@post.comments.new
  end

  def new
    @blog=Blog.find(params[:blog_id])
    @post=@blog.posts.new
  end

  def create
    @blog=Blog.find(params[:blog_id])
    @post=@blog.posts.new(post_params)
    if @post.save
      redirect_to blog_path(@blog)
    else
      render "new"
    end
  end

  def destroy
    @blog=Blog.find(params[:blog_id])
    @post=@blog.posts.find(params[:id])
    if @post.destroy
      redirect_to blog_path(@blog)
    end
  end
  private
  
  def post_params
    params.require(:post).permit(:text, :user_id, :avatar)
  end 
end
