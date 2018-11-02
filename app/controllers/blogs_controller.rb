class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = current_user.blogs.new
  end

  def show
    @blog=Blog.find(params[:id])
    @posts = @blog.posts.all
  end 
  
  def edit 
    @blog = current_user.blogs.find(params[:id])
  end
  
  def update
    @blog = current_user.blogs.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render 'edit'
    end
  end
  
  def create
    @blog = current_user.blogs.new(blog_params)
    if @blog.save
      redirect_to blogs_path
    else
      render 'new'
    end
  end

  def destroy
    @blog = current_user.blogs.find(params[:id])
    if @blog.destroy
      redirect_to blogs_path
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title)
  end
end
