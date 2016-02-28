class Mailing < ActionMailer::Base
  default from: 'railsgirlskrakow@gmail.com'

  def after_submission(submission)
    mail(to: submission.email, subject: 'Rails Girls Kraków 2016: Thank you for your submission')
  end
end
