class UsersController<ApplicationController

  def profile
    if current_user
    @user = User.find params[:id]
    else
      redirect_to "/"
    end
  end

  def show
    if current_user
    @users = User.all
    else
      redirect_to "/"
    end
  end

  def picture
    if current_user
      current_user.update(
      picture: params[:user][:picture]
      )
      redirect_to :back, notice: "Picture Uploaded"
    else
      redirect_to "/"
    end
  end
end
