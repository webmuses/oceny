class FormsController < ApplicationController
  layout false

  before_action :set_custom_headers

  def show
    form = Form.find_by(form_params)

    render :show, locals: { form: form }
  end

  private

  def set_custom_headers
    response.headers['X-Frame-Options'] = 'ALLOWALL'
  end

  def form_params
    params.permit(:permalink)
  end
end
