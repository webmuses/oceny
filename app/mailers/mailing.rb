class Mailing < ActionMailer::Base
  default from: 'webmuses@gmail.com'

  def after_submission(submission)
    email = submission.email
    mail(to: email, subject: 'Rails Girls Kraków 2015: Thank you for your submission')
  end
end
