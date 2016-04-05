require 'rails_helper'

describe Submission do
  let(:submission) { create(:submission) }
  let(:rate) { build(:rate, submission: submission, nickname: nickname) }
  let(:nickname) { 'ania' }

  describe "validation" do
    subject { rate.valid? }

    it { is_expected.to be true }

    context "nickname already voted" do
      before do
        create(:rate, submission: submission, nickname: nickname)
      end

      it { is_expected.to be false }
    end
  end
end
