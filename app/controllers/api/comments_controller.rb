class Api::CommentsController < Api::BaseController
  def create
    attendee = Attendee.find(params[:attendee_id])

    comment = Comment.create({
      user: current_user,
      attendee: attendee,
      nickname: current_user.nickname,
      body: params[:body]
    })

    render json: comment
  end
end
