class CommentsController < ApplicationController
  def create
    comment = Comment.new
    comment.name = params[:comment][:name]
    comment.email = params[:comment][:email]
    comment.content = params[:comment][:content]
    comment.player_id = params[:comment][:player_id]
    comment.save
    redirect_to :back
  end

  def destroy
  end
end
