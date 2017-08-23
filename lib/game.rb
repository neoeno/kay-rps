class Game
  WINNING_COMBINATIONS = [
    { winner: :rock,     loser: :scissors },
    { winner: :scissors, loser: :paper },
    { winner: :paper,    loser: :rock },
  ]

  def result
    [:computer_win, :player_win, :draw].sample
  end

  def opposing_move(result, move)
    return move if result == :draw
    return what_wins_against_this(move) if result == :computer_win
    what_loses_against_this(move)
  end

  private

  def what_wins_against_this(move)
    winning_combo = WINNING_COMBINATIONS.find do |combo|
      combo[:loser] == move
    end
    winning_combo[:winner]
  end

  def what_loses_against_this(move)
    winning_combo = WINNING_COMBINATIONS.find do |combo|
      combo[:winner] == move
    end
    winning_combo[:loser]
  end
end
