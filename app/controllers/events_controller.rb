class EventsController < ApplicationController
  before_action :authenticate_user!
  layout "admin_layout"

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
	end
	def create_event
		puts params
		add_event=EventDetail.new(:venu_id=>params[:event_detail][:venue_id])
		if add_event.save
			@event = EventDetail.find(add_event.id)
			@image = @event.images.create(:image=>params[:event_detail][:image])

		 #add_event.images(params[:event_detail][:image])
		 #add_event.save
	  end
		redirect_to :controller=>'events',:action=>'event_detail'
	end

	private
	def events_params
  	params.require(:function).permit(:name, :description)
	end

	def event_detail_params
  	params.require(:event_detail).permit(:venue_id)
	end

end
