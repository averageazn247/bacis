class StaticPagesController < ApplicationController
  def home
    #
    if current_user
     @transactions = current_user.transactions.where(:status => 0).paginate(page: params[:page], per_page: 4)
     @transactions_by_date = @transactions.group_by(&:deadline)
     @date = params[:date] ? Date.parse(params[:date]) : Date.today
   end
   
   @locations = Event.all 
   @json = Gmaps4rails.build_markers(@locations) do |city, marker|
       marker.lat city.latitude
       marker.lng city.longitude
       marker.infowindow city.desc
       marker.picture({
         'url' => "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
    "width"=>  36,
          "height"=> 36
       })
       marker.title city.title
       marker.json({ title: city.title})
      
                  end
  end

  def help
  end
  
  def about
  end
end
