class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      if params[:game_id]
        redirect_to campaign_game_path(params[:campaign_id], params[:game_id])
      else
        redirect_to campaign_path(params[:campaign_id])
      end
    else
      render :edit
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    if params[:game_id]
      redirect_to campaign_game_path(params[:campaign_id], params[:game_id])
    else
      redirect_to campaign_path(params[:campaign_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :comment,
      :campaign_id,
      :game_id,
      :user_id
    )
  end
end
