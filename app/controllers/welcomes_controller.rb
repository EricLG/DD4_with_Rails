class WelcomesController < ApplicationController
  layout :no_sidebloc

  def index
    @random_items = MagicItem.all.sample(2)
    # @random_feats = Feat.all.sample(4)
  end

  def no_sidebloc
    'no_sidebloc' if @current_user
  end
end
