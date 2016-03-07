class Mailing < ActionMailer::Base
  default from: 'railsgirlskrakow@gmail.com'

  def after_submission(id)
    submission = Submission.find(id)
    mail(to: submission.email, subject: 'Rails Girls Kraków 2016: Thank you for your submission')
  end
end
