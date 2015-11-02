class PostsController<ApplicationController

def index
  @posts = Post.all
end

def show
  @post = Post.find params[:id]
  @comment = Comment.new(
  commentable: @post
  )
  @vote = Vote.new(
  votable: @post
  )
end

def new
  @post = Post.new
end

def create
 Post.create(
  title: params[:post][:title],
  body: params[:post][:body],
  user_id: params[:post][:user_id]
  )
  redirect_to "/posts/#{Post.last.id}"
end

def edit
  @post = Post.find params[:id]
end

def update
end

end
