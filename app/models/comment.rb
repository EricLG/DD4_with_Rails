class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :character
  enum roleplay: { rp: 1, debrief: 2, note: 3 }

  def owned?(current_user)
    self.user == current_user
  end
end
