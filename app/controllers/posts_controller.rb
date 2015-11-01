class PostsController<ApplicationController

def index
  @posts = Post.all
end

def show
  @post = Post.find params[:id]
  @comment = Comment.new(
  commentable: @post
  )
end

def new
  @post = Post.new
end

def create
  @post = Post.create(
  :title
  )
end

def edit
  @post = Post.find params[:id]
end

def update
end

end
