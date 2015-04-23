module Api
  class SubmissionsController < Api::BaseController
    def index
      render_collection(Submission.all)
    end

    def show
      render json: Submission.find(params[:id]), serializer: SubmissionSingleSerializer
    end

    def pending
      render_collection(Submission.pending)
    end

    private

    def render_collection(collection)
      render json: collection, each_serializer: SubmissionEachSerializer
    end
  end
end
