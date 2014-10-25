class PickupsController < ApplicationController
  def new
         @pickup = Pickup.new(params[:pickup])
      @ip=request.remote_ip
  end
      def create 
       @pickup = Pickup.new(params[:pickup])
      @ip=request.remote_ip
    respond_to do |format|
      if @pickup.save
        format.html { redirect_to @pickup, notice: 'Pick up request was successfully booked.' }
        format.json { render json: @pickup, status: :created, location: @pickup }
        
      else
        format.html { render action: "new" }
        format.json { render json: @pickup.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
   @pickup=Pickup.find(params[:id])
  end
  def show
    @pickup=Pickup.find(params[:id])
  end
end
