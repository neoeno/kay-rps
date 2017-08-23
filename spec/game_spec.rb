require_relative '../lib/game'

RSpec.describe Game do
  let(:result_class) { double :result_class }
  subject { Game.new(result_class) }

  describe "#make_result" do
    it "player wins sometimes" do
      srand(1)
      expect(result_class).to receive(:new).with(:rock, :player_win)
      subject.make_result(:rock)
    end

    it "computer wins sometimes" do
      srand(2)
      expect(result_class).to receive(:new).with(:rock, :computer_win)
      subject.make_result(:rock)
    end

    it "they draw sometimes" do
      srand(3)
      expect(result_class).to receive(:new).with(:rock, :draw)
      subject.make_result(:rock)
    end
  end
end
