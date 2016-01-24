# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  
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
    @user=User.new(:email=>params[:user][:email],:password=>params[:user][:password],:password_confirmation=>params[:user][:password_confirmation])
    if @user.save
    redirect_to :controller=>'sessions', :action=>'new'
    else
      flash[:notice]="There is come problem"
    end
  end

  def update
    puts"33333333333333333333333333333333333333"
    super
  end
end 