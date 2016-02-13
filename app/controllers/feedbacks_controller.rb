class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
    @feedbacks = Feedback.all
    render :layout => 'admin_layout'
  end

  # def show
  # end

  def new
    @feedback = Feedback.new
    render :layout => 'customer_layout'
  end

  # def edit
  # end

  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to :back, notice: 'Feedback was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @feedback.update(feedback_params)
  #       format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @feedback }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @feedback.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    @feedback.destroy
      flash[:notice]= 'Feedback was successfully destroyed.'
      redirect_to :action=>'index'
  end

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def feedback_params
      params.require(:feedback).permit(:user_id, :feedback, :date, :email)
    end
end
