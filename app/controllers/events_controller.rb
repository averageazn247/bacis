class EventsController < ApplicationController
      def mercury_update
  post = Event.find(params[:id])
  # Update page
  post.title=params[:content][:page_topic][:value]
  post.desc= params[:content][:page_body][:value]
  post.start=params[:content][:page_time][:value]
  post.address=params[:content][:page_address][:value]
  post.dayof=params[:content][:page_date][:value]
  post.save!
  render :json => {:url => post_path(post)}
  end
  def new
    
    @event=Event.new
  end
  
  def show
    @event=Event.find(params[:id])
  end
  def index
    @events=Event.all
    
  end
  def list
    @event=Event.all
  end
  def map
    @event=Event.all
  end
end
