class EventsController < ApplicationController
      def mercury_update
  post = Event.find(params[:id])
  # Update page
  post.title=params[:content][:page_topic][:value]
  post.desc= params[:content][:page_body][:value] 
  post.address=params[:content][:page_address][:value] 
  post.save!
  render :json => {:url => post_path(post)}
  end
    def index
    @locations = Event.all
    @json = Event.all.to_gmaps4rails
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end
  def new
    
    @event=Event.new
        respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end
  def create
       @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
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
