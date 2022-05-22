
class CommentsController < ApplicationController
  before_action :require_login
  before_action :set_comment, except: [:index, :new, :create]
  before_action :set_post

  def new
    if @post
      @comment = @post.comments.build
    else
      @comment = Comment.new
    end
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      render :new
    end
  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@comment.post)
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :content, reaction_ids: [])
  end

  def set_comment
    @comment = Comment.find_by_id(params[:id])
  end

  def set_post
    @post = Post.find_by_id(params[:post_id])
  end
end