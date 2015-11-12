class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  include EmojiHelper


  def create
    if params[:comment]
      params[:comment][:body] = emojify(params[:comment][:body])
      resource.update_attributes(params)
    else
      params[:post][:body] = emojify(params[:post][:body])
      resource.update_attributes(params)
    end
  end



    def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
    end

helper_method :mailbox, :conversation

private
def mailbox
  @mailbox ||= current_user.mailbox
end

def conversation
  @conversation ||= mailbox.conversations

end

protected

  def active_page(active_page)
    @active == active_page ? "active":""
  end
end
