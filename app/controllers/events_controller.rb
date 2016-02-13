class EventsController < ApplicationController
  before_action :authenticate_user!
  layout "admin_layout"
  #layout "customer_layout"

	def index
	end

	def new
	end

	def show
	end

	def venue_detail
		@function=FunctionDetail.all
	end
	
	def function
		@function=FunctionDetail.new
	  render :layout=>false
	end

	def create_function
		@function=FunctionDetail.new(events_params)
		if @function.save
			flash[:notice]="Successfully Created"
		else
			flash[:error]="There is some problem"
		end
		redirect_to :controller=>'events',:action=>'venue_detail'
	end

	def price
		@price=Price.all
	end

	def add_price
		@price=Price.new
		@function=FunctionDetail.all.pluck(:name,:id)
	  render :layout=>false
	end

	def create_price
		@price=Price.new
		@price.function_id=params[:price][:function_id]
		@price.price=params[:price][:price]
		@price.description=params[:price][:description]
		if @price.save
			flash[:notice]="Successfully Created"
		else
			flash[:error]="There is some problem"
		end
		redirect_to :controller=>'events',:action=>'price'
	end

	def venue
		@venue = Venue.all
	end
	
	def add_venue
		venue=Venue.new
	  render :layout=>false
	end

	def create_venue
		venue=Venue.new
		venue.name=params[:venue_detail][:name]
		venue.address=params[:venue_detail][:address]
		if venue.save
			flash[:notice]="Successfully Created"
		else
			flash[:error]="There is some problem"
		end
		redirect_to :controller=>'events',:action=>'venue'
	end

	def event_detail
		@event_detail = EventDetail.all
	end
	def add_event
		add_event=EventDetail.new
		@venue = Venue.all.pluck(:name,:id)
		@function = FunctionDetail.all.pluck(:name,:id)
	end
	def create_event
		add_event=EventDetail.new(:venu_id=>params[:event_detail][:venue_id],:phone_number=>params[:event_detail][:phone_number],
			:mobile_number=>params[:event_detail][:mobile_number],:capacity=>params[:event_detail][:capacity],
			:function_id=>params[:event_detail][:function_id],:price_id=>params[:event_detail][:price])
		if add_event.save
			@event = EventDetail.find(add_event.id)
			@image = add_event.images.new(:image=>params[:event_detail][:image],:title=>params[:event_detail][:title])
    end
  	if @image.save
			flash[:notice]="Successfully Created"
		else
			flash[:error]="There is some problem"
		end

		 #add_event.images(params[:event_detail][:image])
		 #add_event.save
		redirect_to :controller=>'events',:action=>'event_detail'
	end

	def venue_address
		if params[:function]=="by_venue"
			venue_address = Venue.find_by(:id=>params[:venue_id])
			@venue_address = venue_address[:address]
		else
			price = Price.find_by(:id=>params[:function_id])
			@venue_address = price[:price]
		end
		render :json=>{:venue_address=>@venue_address}
	end

	def new_booking
    @new_booking = BookEvent.where(:status=>"pending")
	end

	def update_booking
    @result = BookEvent.find_by(:booking_id=>params[:booking_id]).update(:status=>params[:booking_status])
		respond_to do |format|
      format.json { render :json => @result.to_json }
    end
	end

	def view_booking
    @booing_history = BookEvent.all
	end

	def view_event_detail
		@function = FunctionDetail.all.pluck(:name,:id)
    @venue = Venue.all.pluck(:name,:id)
	end

	def event_image
		@event_detail = EventDetail.where(:function_id=>params[:function_id],:venu_id=>params[:venue_id])
		render :layout=>false
	end

	private
	def events_params
  	params.require(:function).permit(:name, :description)
	end

	def event_detail_params
  	params.require(:event_detail).permit(:venue_id)
	end

end
