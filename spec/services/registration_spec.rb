require 'spec_helper'

describe Registration do
  describe ".open?" do
    subject { Timecop.freeze(now) { Registration.open? } }

    let(:from) { DateTime.parse("10.07.1987") }
    let(:to) { DateTime.parse("23.07.1987") }

    before do
      allow(Registration).to receive(:date).with(:from).and_return(from)
      allow(Registration).to receive(:date).with(:to).and_return(to)
    end

    context "open" do
      let(:now) { from + 1.day }

      it { is_expected.to be true }
    end

    context "before" do
      let(:now) { from - 1.day }

      it { is_expected.to be false }
    end

    context "after" do
      let(:now) { to + 1.day }

      it { is_expected.to be false }
    end
  end
end
