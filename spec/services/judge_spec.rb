require 'rails_helper'

describe Judge::Service do
  describe "#call" do
    let(:judge) { Judge::Service.new(submission) }

    before do
      judge.call
    end

    subject { submission.reload.rejected }

    context "submission is under age" do
      let(:submission) { create(:submission, age: 12) }

      it { is_expected.to be true }
    end

    context "submission was before" do
      let(:submission) { create(:submission, been_before: true) }

      it { is_expected.to be true }
    end

    context "submission knows English too poor" do
      let(:poor_english) { Submission.english_answers.first }
      let(:submission) { create(:submission, english: poor_english) }

      it { is_expected.to be true }
    end

    shared_examples_for "too poor at" do |technology|
      context "submission knows #{technology} too poor" do
        let(:experience) do
          answer = Submission.experience_answers.first
          default_experience.merge(technology => answer)
        end
        let(:submission) { create(:submission, experience: experience) }

        it { is_expected.to be true }
      end
    end

    shared_examples_for "good at" do |technology|
      let(:experience) do
        answer = Submission.experience_answers.last
        default_experience.merge(technology => answer)
      end
      let(:submission) { create(:submission, experience: experience) }

      it { is_expected.to be false }
    end

    shared_examples_for "too good at" do |technology|
      let(:experience) do
        answer = Submission.experience_answers.last
        default_experience.merge(technology => answer)
      end
      let(:submission) { create(:submission, experience: experience) }

      it { is_expected.to be true }
    end

    it_behaves_like "too poor at", "html"
    it_behaves_like "too poor at", "css"

    it_behaves_like "good at", "js"
    it_behaves_like "good at", "databases"
    it_behaves_like "good at", "programming"

    it_behaves_like "too good at", "rails"
  end
end
