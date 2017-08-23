require 'rulebook'

class Result
  def initialize(player_move, outcome, rulebook = Rulebook.new)
    @player_move = player_move
    @outcome = outcome
    @rulebook = rulebook
  end

  attr_reader :player_move, :outcome

  def computer_move
    return @rulebook.draws_to(player_move) if outcome == :draw
    return @rulebook.beats(player_move) if outcome == :player_win
    @rulebook.beaten_by(player_move)
  end
end
