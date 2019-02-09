module GamesHelper
  def game_index(games, game)
    index = games.index(game)
    index != 0 ? prev_i = games[index - 1] : nil
    index != (games.count - 1) ? next_i = games[index + 1] : nil
    [prev_i, next_i]
  end
end
