class Rulebook
  WINNING_COMBINATIONS = [
    { winner: :rock,     loser: :scissors },
    { winner: :scissors, loser: :paper },
    { winner: :paper,    loser: :rock },
  ]

  def beats(item)
    find_by(:winner, item)[:loser]
  end

  def beaten_by(item)
    find_by(:loser, item)[:winner]
  end

  def draws_to(item)
    item
  end

  private

  def find_by(key, value)
    WINNING_COMBINATIONS.find do |combo|
      combo[key] == value
    end
  end
end
