class DriversController < ApplicationController
  def new
    @driver=Driver.new(params[:id])
    
  end
      def create 
       @driver = Driver.new(params[:driver])

    respond_to do |format|
      if @driver.save
        format.html { redirect_to @driver, notice: 'Night was successfully booked.' }
        format.json { render json: @driver, status: :created, location: @driver }
        
      else
        format.html { render action: "new" }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    @driver=Driver.find(params[:id])
  end
    def edit
    @driver=Driver.find(params[:id])
  end
  def index
    @drivers=Driver.all
  end 
  
end
