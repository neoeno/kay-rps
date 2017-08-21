require_relative '../lib/game'

RSpec.describe Game do
  subject(:game) { Game.new }

  describe "#result" do
    it "player wins sometimes" do
      srand(1)
      expect(game.result).to eq :player_win
    end

    it "computer wins sometimes" do
      srand(2)
      expect(game.result).to eq :computer_win
    end

    it "they draw sometimes" do
      srand(3)
      expect(game.result).to eq :draw
    end
  end

  describe "#what_wins_against_this" do
    context "with rock" do
      it "returns paper" do
        expect(game.what_wins_against_this(:rock)).to eq :paper
      end
    end

    context "with paper" do
      it "returns scissors" do
        expect(game.what_wins_against_this(:paper)).to eq :scissors
      end
    end

    context "with scissors" do
      it "returns rock" do
        expect(game.what_wins_against_this(:scissors)).to eq :rock
      end
    end
  end

  describe "#what_loses_against_this" do
    context "with rock" do
      it "returns paper" do
        expect(game.what_loses_against_this(:rock)).to eq :scissors
      end
    end

    context "with paper" do
      it "returns scissors" do
        expect(game.what_loses_against_this(:paper)).to eq :rock
      end
    end

    context "with scissors" do
      it "returns rock" do
        expect(game.what_loses_against_this(:scissors)).to eq :paper
      end
    end
  end
end
