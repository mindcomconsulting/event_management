# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  
  def index
  end

  def new
    super
    puts"1111111111111111i inside new on reg controller 111111111111111111111"
  end

  def edit
    puts"000000000000000000 inside edit reg controller 0000000000000000000000000"
    puts params

    puts"000000000000000000 inside edit reg controller 0000000000000000000000000"

  end

  def create
    puts"2222222222222222222222222222222222222"
    puts params
    puts"2222222222222222222222222222222222222"
    @user=User.new(:email=>params[:user][:email],:password=>params[:user][:password],:password_confirmation=>params[:user][:password_confirmation],:user_name=>params[:user][:user_name],:first_name=>params[:user][:first_name],:middle_name=>params[:user][:middle_name],:last_name=>params[:user][:last_name],:mobile_no=>params[:user][:mobile_no],:address=>params[:user][:address])
    if @user.save
    redirect_to :controller=>'sessions', :action=>'new'
    else
      flash[:notice]="There is come problem"
    end
  end

  def update
    puts"000000000000000000 inside update reg controller 0000000000000000000000000"
    puts params
    puts"000000000000000000 inside update reg controller 0000000000000000000000000"
    @user=User.find_by(:id=>params[:user][:id])
    # @user.update(:email=>params[:user][:email],:user_name=>params[:user][:user_name],:first_name=>params[:user][:first_name],:middle_name=>params[:user][:middle_name],:last_name=>params[:user][:last_name],:mobile_no=>params[:user][:mobile_no],:address=>params[:user][:address])
    # if params[:user][:password].present?
    #   @user.update(:password=>params[:user][:password],:password_confirmation=>params[:user][:password_confirmation])
    # end
  

    @user.email=params[:user][:email]
    @user.user_name=params[:user][:user_name]
    @user.first_name=params[:user][:first_name]
    @user.middle_name=params[:user][:middle_name]
    @user.last_name=params[:user][:last_name]
    @user.mobile_no=params[:user][:mobile_no]
    @user.address=params[:user][:address]
    @user.save
    if params[:user][:password].present?
      @user.update(:password=>params[:user][:password],:password_confirmation=>params[:user][:password_confirmation])
    end


    redirect_to :controller=>'events',:action=>'index'
    #super
  end
end 