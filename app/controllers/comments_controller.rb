class CommentsController<ApplicationController

  def new
    @comments = Comment.all
  end

  def display
    @comment = Comment.find params[:id]
  end

  def create
    Comment.create(
    subject: params[:comment][:subject],
    body: params[:comment][:body],
    user_id: current_user.id,
    commentable_id: params[:comment][:commentable_id],
    commentable_type: params[:comment][:commentable_type]
    )
    redirect_to @post, notice: "comment commented"
  end
end
