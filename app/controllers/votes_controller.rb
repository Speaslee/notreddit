class VotesController<ApplicationController
  def new
    @votes = Vote.all
  end

  def create
    if Vote.where(votable_id: params[:vote][:votable_id], votable_type: params[:vote][:votable_type], user_id: current_user.id).count < 1
        Vote.create(
        user_id: current_user.id,
        status: params[:vote][:status],
        votable_id: params[:vote][:votable_id],
        votable_type: params[:vote][:votable_type]
        )
        redirect_to :back, notice: "vote recorded"
      elsif Vote.where(votable_id: params[:vote][:votable_id], votable_type: params[:vote][:votable_type], user_id: current_user.id).count == 1
        Vote.where(votable_id: params[:vote][:votable_id],votable_type: params[:vote][:votable_type], user_id: current_user.id).first.update(
        status: params[:vote][:status]
        )
        redirect_to :back, notice: "vote changed"
    else
      redirect_to :back, notice: "You already voted for this"
    end
  end
end
