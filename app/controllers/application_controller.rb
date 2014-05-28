class ApplicationController < ActionController::Base
  protect_from_forgery
  def index
    if current_user
      @id=current_user.id
    end
  end
  def authenticate_admin!
 redirect_to new_user_session_path unless current_user.is_admin?
end
    def authenticate_admin_user!
    authenticate_user!
    unless current_user.superadmin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end
    def location
  if params[:location].blank?
    if Rails.env.test? || Rails.env.development?
  
    else
      @location ||= request.location
    end
  else
    params[:location].each {|l| l = l.to_i } if params[:location].is_a? Array
    @location ||= Geocoder.search(params[:location]).first
    @location
  end
end 


end
