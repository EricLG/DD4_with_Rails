class God < ActiveRecord::Base
  def display_name_and_alignemnt
    "#{name} - #{alignment}"
  end
end
