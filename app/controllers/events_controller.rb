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

	def edit_function
		puts"000000000000000000000000000000"
		puts params
		puts"000000000000000000000000000000"
		@function = FunctionDetail.find_by(:id=>params[:id])
		render :layout=>false
	end

	def update_function
		puts"updateeeeeeeeeeeeeeeeee"
		puts params
		puts"updateeeeeeeeeeeeeeeeee"
		function = FunctionDetail.find_by(:id=>params[:function][:id])
		function.update(events_params)
		if function
			flash[:notice]="Successfully Updated"
		else
			flash[:error]="There is some problem"
		end
		redirect_to :controller=>'events',:action=>'venue_detail'
	end

	def delete_function
		function = FunctionDetail.find_by(:id=>params[:id])
		if function.delete
			flash[:notice]="Successfully Deleted"
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

	def edit_price
		puts"000000000000000000000000000000"
		puts params
		puts"000000000000000000000000000000"
		@price = Price.find_by(:id=>params[:id])
		@function=FunctionDetail.all.pluck(:name,:id)
		render :layout=>false
	end

	def update_price
		puts"updateeeeeeeeeeeeeeeeee"
		puts params
		puts"updateeeeeeeeeeeeeeeeee"
		price = Price.find_by(:id=>params[:price][:id])
		price.update(:function_id=>params[:price][:function_id],:price=>params[:price][:price],:description=>params[:price][:description])
		if price
			flash[:notice]="Successfully Updated"
		else
			flash[:error]="There is some problem"
		end
		redirect_to :controller=>'events',:action=>'price'
	end

	def delete_price
		price = Price.find_by(:id=>params[:id])
		if price.delete
			flash[:notice]="Successfully Deleted"
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

	def show_venue
	end
	def edit_venue
		puts"000000000000000000000000000000"
		puts params
		puts"000000000000000000000000000000"
		@venue_detail = Venue.find_by(:id=>params[:id])
		render :layout=>false
	end
	def update_venue
		puts"updateeeeeeeeeeeeeeeeee"
		puts params
		puts"updateeeeeeeeeeeeeeeeee"
		venue = Venue.find_by(:id=>params[:venue_detail][:id])
		venue.update(:name=>params[:venue_detail][:name],:address=>params[:venue_detail][:address])
		if venue
			flash[:notice]="Successfully Updated"
		else
			flash[:error]="There is some problem"
		end
		redirect_to :controller=>'events',:action=>'venue'
	end
	def delete_venue
		venue = Venue.find_by(:id=>params[:id])
		if venue.delete
			flash[:notice]="Successfully Deleted"
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
		add_event=EventDetail.new(:venu_id=>params[:event_detail][:venu_id],:phone_number=>params[:event_detail][:phone_number],
			:mobile_number=>params[:event_detail][:mobile_number],:capacity=>params[:event_detail][:capacity],
			:function_id=>params[:event_detail][:function_id],:price_id=>params[:event_detail][:price_id])
		
  	if add_event.save
			flash[:notice]="Successfully Created"
		else
			flash[:error]="There is some problem"
		end
		redirect_to :controller=>'events',:action=>'event_detail'
	end

	def edit_event_detail
		@event_detail = EventDetail.find_by(:id=>params[:id])
		@venue = Venue.all.pluck(:name,:id)
		@function = FunctionDetail.all.pluck(:name,:id)
		render :layout=>false
	end

	def update_event_detail
		add_event = EventDetail.find_by(:id=>params[:event_detail][:id])
		updated_event = add_event.update(:venu_id=>params[:event_detail][:venu_id],:phone_number=>params[:event_detail][:phone_number],
			:mobile_number=>params[:event_detail][:mobile_number],:capacity=>params[:event_detail][:capacity],
			:function_id=>params[:event_detail][:function_id],:price_id=>params[:event_detail][:price_id])
		if updated_event
			flash[:notice]="Successfully Updated"
		else
			flash[:error]="There is some problem"
		end
		redirect_to :controller=>'events',:action=>'event_detail'
	end

	def delete_event_detail
		event = EventDetail.find_by(:id=>params[:id])
		if event.delete
			flash[:notice]="Successfully Deleted"
		else
			flash[:error]="There is some problem"
		end
		redirect_to :controller=>'events',:action=>'event_detail'
	end


	def venue_image
		@venue_image = EventDetail.find_by(:id=>params[:id])
		@image = Image.where(:imageable_id=>params[:id])
		
	end

	def save_venue_image
		
		add_event = EventDetail.find_by(:id=>params[:venue_detail][:imageable_id])
		@all_image = params[:ffff]
		@all_image.each do |obj|
			image = add_event.images.new(:image=>obj)
			image.save
		end
		redirect_to :back
	end

	def venue_address
		if params[:function]=="by_venue"
			venue_address = Venue.find_by(:id=>params[:venue_id])
			@venue_address = venue_address.address
		else
			price_obj = Price.find_by(:id=>params[:function_id])
			#venue_address = price.price
			if price_obj.present?
				@venue_address = price_obj.price
			else
				@venue_address = 'no data'
			end
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
		puts "0000000000000000000000000000000"
		puts params
		puts "0000000000000000000000000000000"
		@event_detail = EventDetail.where(:function_id=>params[:function_id],:venu_id=>params[:venue_id])
		@image = Image.where(:imageable_id=>@event_detail[0].id)
		
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
