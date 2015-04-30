require 'rails_helper'

describe User do
  describe '.current_watching_for' do
    let(:now) { Time.parse("10.07.1987") }

    let(:submission) { create(:submission) }

    let(:user) { create(:user, last_watched_submission_id: submission.id,
      last_watched_submission_at: now) }
    let(:other_user) { create(:user, last_watched_submission_id: submission.id,
      last_watched_submission_at: now - 1.hour) }
    let(:current_user) { create(:user, last_watched_submission_id: submission.id,
      last_watched_submission_at: now) }

    subject do
      Timecop.freeze(now) do
        User.current_watching_for(submission.id, current_user.id)
      end
    end

    it { is_expected.to include(user) }
    it { is_expected.to_not include(other_user) }
    it { is_expected.to_not include(current_user) }
  end
end
