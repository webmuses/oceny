require 'rails_helper'

describe Submission do
  let(:submission) { create(:submission) }

  describe "scopes" do
    def submission_with_rates(rates_count = 0)
      submission = create(:submission)
      rates_count.times { create(:rate, submission: submission) }
      submission
    end

    def rejected_with_rates(rates_count = 0)
      submission = submission_with_rates(rates_count)
      submission.update_attributes(rejected: true)
      submission
    end

    let(:min_rates_count) { Submission::MIN_RATES_COUNT }

    let!(:pending_submission) { submission_with_rates(min_rates_count - 1) }
    let!(:submission_without_rates) { create(:submission) }
    let!(:pending_rejected) { rejected_with_rates(min_rates_count - 1) }
    let!(:rated_submission) { submission_with_rates(min_rates_count + 1) }
    let!(:rated_rejected) { rejected_with_rates(min_rates_count + 1) }
    let!(:rejected_submission) { create(:submission, rejected: true) }

    describe ".pending" do
      subject { Submission.pending.to_a.sort }

      it { is_expected.to eq([pending_submission,
                              submission_without_rates].sort) }
    end

    describe ".rated" do
      subject { Submission.rated.to_a.sort }

      it { is_expected.to eq([rated_submission]) }
    end

    describe ".rejected" do
      subject { Submission.rejected.to_a.sort }

      it { is_expected.to eq([pending_rejected, rated_rejected,
                              rejected_submission].sort) }
    end
  end

  describe "update_average_rate" do
    before do
      create(:rate, submission: submission, value: 5)
      create(:rate, submission: submission, value: 4)
      submission.update_average_rate
    end

    it { expect(submission.average_rate).to eq(4.5) }
  end
end

