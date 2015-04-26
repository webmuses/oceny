FactoryGirl.define do
  factory :submission do
    sequence(:fullname) { |n| "Submission#{n}" }
    sequence(:email) { |n| "submission#{n}@example.org" }
    age { 21 }
    about { "About" }
    experience { default_experience }
    os { Submission.os_answers.last }
    english { Submission.english_answers.last }
    reason { "Good reason" }
    been_before { false }
  end

  factory :rate do
    sequence(:nickname) { |n| "GithubUser#{n}" }
  end
end

