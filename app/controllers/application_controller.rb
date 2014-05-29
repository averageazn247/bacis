class ApplicationController < ActionController::Base
  protect_from_forgery
  def authenticate_admin_user!
  authenticate_user! 
  unless current_user.admin?
    flash[:alert] = "This area is restricted to administrators only."
    redirect_to root_path 
  end
end
 
def current_admin_user
  return nil if user_signed_in? && !current_user.admin?
  current_user
end

  def index
    if current_user
      @id=current_user.id
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
