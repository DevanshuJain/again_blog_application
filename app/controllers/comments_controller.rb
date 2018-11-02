class CommentsController < ApplicationController
  # respond_to :html, :js
  

  def create
    @blog=Blog.find(params[:blog_id])
    @post=Post.find(params[:post_id])
    @comment=@post.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_to blog_post_path(@blog ,@post), notice: "Save comment completed!" } 
      end
    end
  end

  def edit
    @blog=Blog.find(params[:blog_id])
    @post=Post.find(params[:post_id])
    @comment=@post.comments.find(params[:id])
  end
  
  def update
    @blog=Blog.find(params[:blog_id])
    @post=Post.find(params[:post_id])
    @comment=@post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to blog_post_path(@blog ,@post)
    end
  end

  def destroy
    @blog=Blog.find(params[:blog_id])
    @post=Post.find(params[:post_id])
    @comment=Comment.find(params[:id])
    if @comment.destroy
      redirect_to blog_post_path(@blog ,@post)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :user_id)
  end
end
