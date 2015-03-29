module Api
  class CommentsController < Api::BaseController
    def create
      submission = Submission.find(params[:submission_id])

      comment = Comment.create({
        user: current_user,
        submission: submission,
        nickname: current_user.nickname,
        body: params[:body]
      })

      render json: comment
    end
  end
end
