FactoryGirl.define do
  factory :submission do
    sequence(:fullname) { |n| "Submission#{n}" }
    sequence(:email) { |n| "submission#{n}@example.org" }
    age { 21 }
    about { "About" }
    experience { default_experience }
    codecademy_username 'user'
    os { Submission.os_answers.last }
    english { Submission.english_answers.last }
    reason { "Good reason" }
    been_before { false }
  end

  factory :rate do
    sequence(:nickname) { |n| "GithubUser#{n}" }
  end

  factory :user do
    last_watched_submission_id { submission.id }
    last_watched_submission_at { Time.new }
  end
end
