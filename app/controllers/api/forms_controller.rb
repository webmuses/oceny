module Api
  class FormsController < Api::BaseController
    def show
      render json: Form.first_or_initialize
    end

    def create
      form = Form.first_or_initialize
      form.assign_attributes(form_params)
      form.save

      render json: form
    end

    private

    def form_params
      params.permit(:name)
    end
  end
end
