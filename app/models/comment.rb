class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  enum roleplay: { rp: 1, debrief: 2, note: 3 }

  def owned?(current_user)
    self.user == current_user
  end
end
