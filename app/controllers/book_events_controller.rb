class BookEventsController < ApplicationController
  layout "customer_layout"

	def event_details
		@event = BookEvent.all
	end

	def new_event
		@event = BookEvent.new
		@event_list = FunctionDetail.all.pluck(:name,:id)
		@event_venue = Venue.all.pluck(:name,:id)
		puts"000000000000000000000000000"
		puts @event_list
		puts"000000000000000000000000000"
	end

	def create_event
  end 

end
