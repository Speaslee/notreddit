class CommentsController<ApplicationController

  def new
    @comments = Comment.all
  end

  def display
    @comment = Comment.find params[:id]
  end

  def update
    if current_user.id == Comment.find(params[:id]).user_id
      Comment.find(params[:id]).update(
      body: params[:comment][:body]
      )
      redirect_to :back, notice: "comment edited"
    else
      redirect_to :back, notice: "You can't edit comments you didn't make"
    end
  end

  def create
    Comment.create(
    subject: params[:comment][:subject],
    body: params[:comment][:body],
    user_id: current_user.id,
    commentable_id: params[:comment][:commentable_id],
    commentable_type: params[:comment][:commentable_type]
    )
    redirect_to :back, notice: "comment commented"
  end
end
