class ApplicationsController < ApplicationController
  respond_to :html, :json

  def index
    render json: Application.all, each_serializer: ApplicationBriefSerializer
  end

  def show
    respond_with(Application.find(params[:id]))
  end

  def upload
    Importer.new(params[:file], Application).import

    redirect_to '#/applications'
  end
end
