class Api::FormsController < Api::BaseController
  def index
    render json: Form.all
  end
end
