class FormsController < ApplicationController
  layout false

  skip_before_action :authenticate
  before_action :set_custom_headers

  def show
    form = Form.find_by(form_params)
    submission = Submission.new

    render :show, locals: { form: form, submission: submission }
  end

  def submit
    form = Form.find_by(form_params)

    submission = Submission.new(submission_params)
    if submission.save
      redirect_to(thanks_path)
    else
      redirect_to(form_path(params[:permalink]))
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
    params.require(:submission).permit(*Submission::FIELD_NAMES)
  end
end
