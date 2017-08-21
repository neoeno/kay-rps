class Game
  def result
    [:computer_win, :player_win, :draw].sample
  end

  def what_wins_against_this(move)
    {
      rock: :paper,
      paper: :scissors,
      scissors: :rock
    }[move]
  end

  def what_loses_against_this(move)
    {
      paper: :rock,
      scissors: :paper,
      rock: :scissors
    }[move]
  end
end
