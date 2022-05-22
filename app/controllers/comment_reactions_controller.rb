class CommentReactionsController < ApplicationController
  before_action :require_login

  def new
    @comment = Comment.find_by_id(params[:comment_id])
    @comment_reaction = @comment.comment_reactions.new
    @reaction = Reaction.new
    @reactions = Reaction.all
  end

  def create
    @reaction = Reaction.create(user_id: current_user.id, comment_id: comment_reaction_params[:comment_id], emoji: comment_reaction_params[:reaction][:emoji])
    
    @comment = Comment.find_by_id(comment_reaction_params[:comment_id])
    @comment_reaction = CommentReaction.new
    @comment_reaction.comment_id = comment_reaction_params[:comment_id]
    @comment_reaction.reaction_count = comment_reaction_params[:reaction_count]
    @comment_reaction.reaction = @reaction
    @comment_reaction.save
    if creating_reaction #admin user is creating the reaction
      Reaction.create(comment_reaction_params[:reaction_attributes])
    else #user is selecting the reaction
      @comment_reaction.reaction = Reaction.find_by_id(comment_reaction_params[:reaction_id])
    end

    if @comment_reaction.save
      redirect_to comment_path(@comment_reaction.comment_id)
    else
      render :new
    end
  end

  def index
    @comment = Comment.find_by_id(params[:comment_id])
  end

  def destroy_multiple
    if params[:comment_reactions]
      CommentReaction.destroy(params[:comment_reactions])
      @comment = params[:comment_id]
      redirect_to comment_path(@comment)
    end
  end 

  private
  def comment_reaction_params
    params.require(:comment_reaction).permit(:comment_id, :reaction_id, :reaction_count, {:reaction => [:emoji]})
  end

  def creating_reaction
    comment_reaction_params[:reaction_id] == ''
  end
end