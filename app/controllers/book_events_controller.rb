class BookEventsController < ApplicationController
  layout "customer_layout"

	def index
	end
  	
	def event_details
		@event = BookEvent.all
	end

	def new_event
		@event = BookEvent.new
		@event_list = FunctionDetail.all.pluck(:name,:id)
		@event_venue = Venue.all.pluck(:name,:id)
	end


	def function_price
		if params[:request_by] =="function"
			@result = Price.where(:function_id=>params[:function_id]).pluck(:price)
    elsif params[:request_by] =="venue"
			@result = Venue.where(:id=>params[:venue_id]).pluck(:address)
	  end
	  respond_to do |format|
      format.json { render :json => @result.to_json }
    end
	end

	def create_events
		book_event = BookEvent.new(event_params)
		
		if book_event.save
			equipment = FunctionEquipment.new(:book_event_id=>book_event.id)
			equipment.save
			equipment.update(equipment_params)
		end
		if book_event.save
			flash[:notice]="Successfully Created"
		else
			flash[:error]="There is some problem"
		end
		redirect_to :controller=>'book_events', :action=>'new_event'
  end 

  def booking_status
  	if params[:booking_status]=="booking_status"
      @booking_status = BookEvent.where(:booking_id=>params[:booking_id],:user_id=>params[:user_id]).pluck(:status)
    	respond_to do |format|
        format.json { render :json => @booking_status.to_json }
      end
    elsif params[:booking_status]=="by_admin"
      @booking_status = BookEvent.where(:booking_id=>params[:booking_id]).pluck(:status)
  	  respond_to do |format|
        format.json { render :json => @booking_status.to_json }
      end
  	end
  end

  def booking_history
    @booing_history = BookEvent.where(:user_id=>current_user.id)
  end

  def view_event_detail
		@function = FunctionDetail.all.pluck(:name,:id)
	  @venue = Venue.all.pluck(:name,:id)
	end

	def event_image
		@event_detail = EventDetail.where(:function_id=>params[:function_id],:venu_id=>params[:venue_id])
		@image = Image.where(:imageable_id=>@event_detail[0].id)
		render :layout=>false
	end


  private
  def event_params
  	params.require(:book_event).permit(:user_id,:booking_id,:function_id,:venue_id,:no_of_guest,:date,:total_amount,:status)
  end

  def equipment_params
  	params.require(:book_event).permit(:user_id,:dj,:stage,:mike_speaker,:break_fast,:lunch,:tea_snack,:dinner,:food_type,:lunch_type,:dinner_type,:light_type,:flower_type,:sitting_chair_type)
  end
end
