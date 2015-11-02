class VotesController<ApplicationController
  def new
    @votes = Vote.all
  end

  def create
    Vote.create(
    user_id: current_user.id,
    status: params[:vote][:status],
    votable_id: params[:vote][:votable_id],
    votable_type: params[:vote][:votable_type]
    )
    redirect_to "/posts/1", notice: "vote recorded"
  end
end
