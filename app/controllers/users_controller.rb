class UsersController<ApplicationController

def profile
  @user = User.find params[:id]
end

def show
  @users = User.all
end



end
