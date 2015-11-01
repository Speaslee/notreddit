class VotesController<ApplicationController

  def create
    Vote.create(
    user_id: current_user.id,
    votable_id: params[:vote][:votable_id],
    votable_type: params[:vote][:votable_type]
    )
    redirect_to "/posts/1", notice: "comment commented"
  end
end
