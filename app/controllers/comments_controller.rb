class CommentsController < ApplicationController
  def create
    @campaign = Campaign.find(params[:campaign_id])
    @game = Game.find(params[:game_id])
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to campaign_path(@campaign)
    else
      render :edit
    end
    # redirect_to campaign_games_path(@campaign, @game)
  end

  def destroy
    @game = Game.find(params[:game_id])
    @comment = @game.comments.find(params[:id])
    @comment.destroy
    redirect_to game_path(@game)
  end

  private

  def comment_params
    params.require(:comment).permit(
      :comment,
      # :campaign_id, pour plus tard
      :game_id,
      :user_id
    )
  end
end
