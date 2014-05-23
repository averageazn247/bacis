class StaticPagesController < ApplicationController
  def home
    #
    if current_user
     @transactions = current_user.transactions.where(:status => 0).paginate(page: params[:page], per_page: 4)
     @transactions_by_date = @transactions.group_by(&:deadline)
     @date = params[:date] ? Date.parse(params[:date]) : Date.today
   end
   
   @locations = Event.all 
 

  
   @json = Gmaps4rails.build_markers(@locations) do |event, marker|
     
      
     if event.dayof + (7) >=Date.today 
       
  
         marker.lat event.latitude
         marker.lng event.longitude
         marker.title event.title
          marker.json({
                id:       event.id, 
                name:     event.title,
                location: event.address,
                website: event.website,
                time: (event.dayof-Date.today+7),
                cat: event.cat,
                date: event.dayof.month.to_s+'/'+event.dayof.day.to_s+'/'+event.dayof.year.to_s
              })
         
         if event.title !=nil
           if event.desc !=nil
           marker.infowindow event.title+'- '+event.dayof.month.to_s+'/'+event.dayof.day.to_s+'/'+event.dayof.year.to_s+" : \n <br />"+event.desc
           else
             marker.infowindow  event.desc
           end
           else
             if event.desc != nil
              marker.infowindow event.desc
              end
           end
             if event.cat =='view'
               url='https://cdn2.iconfinder.com/data/icons/simplus-media/165/Layer_15-01-32.png'
             elsif event.cat =='tournament'
              url= 'https://developer.blackberry.com/builtforblackberry/webroot/img/common/game_icon.png'
             
             elsif event.cat =='con/pax'
               "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png"
             else
                url = 'https://mnli12.wikispaces.com/file/view/Google%20Maps%20Marker%20Blue.png/354394862/Google%20Maps%20Marker%20Blue.png'
             end
           marker.picture({  
             
            
                  
                  
              'url' => url,  
              
              "width"=>  36,
              "height"=> 36
           })
           marker.title event.title
           marker.json({ title: event.title})
        
           end
      end 
    end

  def help
  end
  
  def about
  end
end
