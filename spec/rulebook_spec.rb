require_relative '../lib/rulebook'

RSpec.describe Rulebook do
  subject { Rulebook }
  
  describe "#beats" do
    specify { expect(subject.beats(:rock)).to eq :scissors }
    specify { expect(subject.beats(:scissors)).to eq :paper }
    specify { expect(subject.beats(:paper)).to eq :rock }
  end

  describe "#beaten_by" do
    specify { expect(subject.beaten_by(:rock)).to eq :paper }
    specify { expect(subject.beaten_by(:scissors)).to eq :rock }
    specify { expect(subject.beaten_by(:paper)).to eq :scissors }
  end

  describe "#draws_to" do
    specify { expect(subject.draws_to(:rock)).to eq :rock }
    specify { expect(subject.draws_to(:scissors)).to eq :scissors }
    specify { expect(subject.draws_to(:paper)).to eq :paper }
  end
end
