class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_back(fallback_location: root_path)
    else
      render :edit
    end
  end

  def update
    @comment = Comment.find_by_id(params[:id])
    flash[:error] = "Erreur sur les champs suivants: #{@comment.errors.full_messages}" unless @comment.update(params.require(:comment).permit(:comment))
    redirect_to where_do_i_come
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  # Retourne l'url d'ou a été validé le commentaire
  def where_do_i_come
    url = campaign_game_path(@comment.campaign_id, @comment.game_id) if @comment.game_id
    url = campaign_path(@comment.campaign_id) if @comment.game_id.nil? && @comment.campaign_id
    url
  end

  def comment_params
    params.require(:comment).permit(
      :comment,
      :roleplay,
      :character_id,
      :campaign_id,
      :game_id,
      :user_id
    )
  end
end
