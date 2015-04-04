class FormsController < ApplicationController
  layout false

  skip_before_action :authenticate
  before_action :set_custom_headers

  def show
    submission = Submission.new

    render :show, locals: { submission: submission }
  end

  def submit
    submission = Submission.new(submission_params)
    if submission.save
      redirect_to(thanks_path)
    else
      redirect_to(form_path)
    end
  end

  def thanks
  end

  private

  def set_custom_headers
    response.headers['X-Frame-Options'] = 'ALLOWALL'
  end

  def form_params
    params.permit(:permalink)
  end

  def submission_params
    params.require(:submission).permit(:fullname, :email, :age, :os, :reason,
      :english, :extra, :experience => [:html, :css, :js, :databases, :rails, :programming])
  end
end
