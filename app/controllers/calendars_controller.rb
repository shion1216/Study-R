class CalendarsController < ApplicationController
  before_action :authenticate_user,{only:[:index, :new, :show, :edit, :month, :target, :months]}
  
  def index
    @calendars = Calendar.where(user_id: current_user.id)
    @calendar = Calendar.all
  end
  
  def new
    @calendar = Calendar.new
  end
  
  def show
    @calendar = Calendar.find(params[:id])
  end
  
  def create
    @calendar = current_user.calendars.new(calendar_params)
    if @calendar.save
      flash[:success] = "完了"
      redirect_to calendars_path
    else
      flash[:success] = "失敗"
      render "target"
    end
  end
  
  def update
    @calendar = Calendar.find(params[:id])
    if @calendar.update(calendar_params)
      flash[:success] = "学習時間の追加を完了しました"
      redirect_to calendars_path
    else
      flash[:success] = "学習時間の追加を失敗しました"
      render "learning"
    end
  end
  
  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    redirect_to calendars_path
  end
  
  def target
    @calendar = Calendar.new
  end
  
  def edit
    @calendar = Calendar.find(params[:id])
  end
  
  def month 
    @calendar = Calendar.new
  end
  
  def months
    start_time =  Date.new(
      calendar_month_params["start_time(1i)"].to_i,
      calendar_month_params["start_time(2i)"].to_i,
      calendar_month_params["start_time(3i)"].to_i
    )
    start_month=start_time.all_month.to_a
    
    
    start_month.each do |date|
      if date.sunday? || date.saturday?
        @calendar = current_user.calendars.create(work_content: calendar_month_params["work_content"],target_time: calendar_month_params["target_time_2"],start_time: date)
      else
        @calendar = current_user.calendars.create(work_content: calendar_month_params["work_content"],target_time: calendar_month_params["target_time_1"],start_time: date)
      end
    end
    flash[:success] = "目標時間の追加完了"
    redirect_to calendars_path
    
    
  end
  
  private
  def calendar_params
    params.require(:calendar).permit(:work_content, :target_time, :learning_time, :start_time, :memo)
  end
  
  def calendar_month_params
    params.require(:calendar).permit(:work_content, :target_time_1, :target_time_2, :user_id, :start_time)
  end
end
