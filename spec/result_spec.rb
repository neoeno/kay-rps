require_relative '../lib/result'

RSpec.describe Result do
  let(:rulebook) { double :rulebook }

  describe "#computer_move" do
    context "with a win" do
      it "returns the move that loses to the player" do
        allow(rulebook).to receive(:beats).and_return(:frog)
        result = Result.new(:goose, :player_win, rulebook)
        expect(result.computer_move).to eq :frog
      end
    end

    context "with a loss" do
      it "returns the move that wins against the player" do
        allow(rulebook).to receive(:beaten_by).and_return(:frog)
        result = Result.new(:goose, :computer_win, rulebook)
        expect(result.computer_move).to eq :frog
      end
    end

    context "with a draw" do
      it "returns the move that draws to the player" do
        allow(rulebook).to receive(:draws_to).and_return(:frog)
        result = Result.new(:goose, :draw, rulebook)
        expect(result.computer_move).to eq :frog
      end
    end
  end
end
