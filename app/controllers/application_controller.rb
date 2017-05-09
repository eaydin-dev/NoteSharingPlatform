class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_count

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :school, :department, :budget, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname, :school, :department, :budget, :email, :password, :password_confirmation, :current_password])
  end

	def get_count
		if user_signed_in?
	      @messages_count = Message.where(:user_receive => current_user.id, :notified => 0).count
	    end
	end
end
