# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  
  def index
  end

  def new
    super
    puts"1111111111111111111111111111111111111"
  end

  def create
    puts"2222222222222222222222222222222222222"
    puts params
    puts"2222222222222222222222222222222222222"
    redirect_to :controller=>'sessions', :action=>'new'
    # add custom create logic here
  end

  def update
    puts"33333333333333333333333333333333333333"
    super
  end
end 