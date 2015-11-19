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
  user_id: params[:post][:user_id],
  tag_list: params[:post][:tag_list]
  )
  redirect_to "/posts/#{Post.last.id}"
end

def edit
  @post = Post.find(params[:id])
end

def tagged
  if params[:post][:tag].present?
    @posts = Post.tagged_with(params[:post][:tag])
  else
    @posts = Post.postall
  end
end


def update
  Post.find(params[:id]).update(
  title: params[:post][:title],
  body: params[:post][:body],
  tag_list: params[:post][:tag_list]
  )
  redirect_to "/posts/#{params[:id]}"
end

end
