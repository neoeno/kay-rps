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

  describe "#opposing_move" do
    context "with player_win & rock" do
      it "returns scissors" do
        expect(game.opposing_move(:player_win, :rock)).to eq :scissors
      end
    end

    context "with player_lose & rock" do
      it "returns scissors" do
        expect(game.opposing_move(:computer_win, :rock)).to eq :paper
      end
    end

    context "with draw & rock" do
      it "returns scissors" do
        expect(game.opposing_move(:draw, :rock)).to eq :rock
      end
    end
  end
end
