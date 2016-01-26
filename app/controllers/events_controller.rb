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

	private
	def events_params
  	params.require(:function).permit(:name, :description)
	end
end
