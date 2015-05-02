module Api
  class SubmissionsBaseController < Api::BaseController
    private

    def render_collection(collection)
      render json: collection, each_serializer: SubmissionEachSerializer, root: :submissions
    end
  end
end
