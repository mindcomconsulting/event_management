# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  #layout "admin_layout"
  
  def index
  end

  def new
    super
  end

  def edit
    if params[:user]=='user'
      render :layout=>'customer_layout'
    else
      render :layout=>'admin_layout'
    end
  end

  def create
    @user=User.new(:email=>params[:user][:email],:password=>params[:user][:password],:password_confirmation=>params[:user][:password_confirmation],:user_name=>params[:user][:user_name],:first_name=>params[:user][:first_name],:middle_name=>params[:user][:middle_name],:last_name=>params[:user][:last_name],:mobile_no=>params[:user][:mobile_no],:address=>params[:user][:address],:user_login_type=>params[:user][:user_login_type])
    if @user.save
    redirect_to :controller=>'sessions', :action=>'new'
    else
      flash[:notice]="There is come problem"
    end
  end

  def update
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
    @user.user_type=params[:user][:user_type]
    @user.save
    if params[:user][:password].present?
      @user.update(:password=>params[:user][:password],:password_confirmation=>params[:user][:password_confirmation])
    end


    redirect_to :controller=>'events',:action=>'index'
    #super
  end
end 