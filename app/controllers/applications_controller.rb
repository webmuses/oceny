class ApplicationsController < ApplicationController
  respond_to :html, :json

  def index
    respond_with(Application.limit(20))
  end

  def show
    respond_with(Application.find(params[:id]))
  end

  def upload
    Importer.new(params[:file], Application).import

    redirect_to '#/applications'
  end
end
