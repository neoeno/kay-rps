require 'result'

class Game
  RESULTS = [:computer_win, :player_win, :draw]

  def initialize(result_class = Result)
    @result_class = result_class
  end

  def make_result(player_move)
    @result_class.new(player_move, random_result)
  end

  private

  def random_result
    RESULTS.sample
  end
end
