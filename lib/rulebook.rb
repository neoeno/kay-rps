class Rulebook
  WINNING_COMBINATIONS = [
    { winner: :rock,     loser: :scissors },
    { winner: :scissors, loser: :paper },
    { winner: :paper,    loser: :rock },
  ]

  def self.beats(item)
    find_by(:winner, item)[:loser]
  end

  def self.beaten_by(item)
    find_by(:loser, item)[:winner]
  end

  def self.draws_to(item)
    item
  end

  private

  def self.find_by(key, value)
    WINNING_COMBINATIONS.find do |combo|
      combo[key] == value
    end
  end
end
