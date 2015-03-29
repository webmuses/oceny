class FormsController < ApplicationController
  layout false

  def show
    form = Form.find_by(form_params)

    render :show, locals: { form: form }
  end

  private

  def form_params
    params.permit(:permalink)
  end
end
