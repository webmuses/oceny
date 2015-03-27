module Api
  class FormsController < Api::BaseController
    def index
      render json: Form.all, each_serializer: FormLightSerializer
    end

    def create
      form = Form.create(name: params[:name])
      render json: form
    end
  end
end
