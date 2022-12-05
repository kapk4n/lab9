class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user_present!
    redirect_to root_path, alert: "You mast be signeed in to do" if Current.user.nil?
  end

end
