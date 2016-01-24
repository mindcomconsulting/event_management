class EventsController < ApplicationController
  before_action :authenticate_user!
	layout "event_mngmt"

	def index
	end
	def new
	end

end
