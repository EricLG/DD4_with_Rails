class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  def own?(current_user)
    self.user == current_user
  end
end
