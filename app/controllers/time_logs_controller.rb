class TimeLogsController < ApplicationController
#  before_filter :ensure_signed_in

  def index
    params[:user_id] = 1
    @user = params[:user_id].blank? ? current_user : User.find(params[:user_id])
    @date = BillDate.find_by_date(Date.current)
    @date ||= BillDate.create(:date => Date.current)

    @time_logs = TimeLog.all(:conditions => ["bill_date_id = ? and user_id =? ", @date, @user], :order => "start_time ASC")

    @time_log = TimeLog.new(:user => @user, :bill_date => @date)

  end

  def new

  end

  def create
    if TimeLog.create(params[:time_log])
      redirect_to time_logs_path(:user_id => params[:time_log][:user_id], :bill_date => params[:time_log][:bill_date])
    else
      flash[:warning] = "There was a problem"
      render time_logs_path
    end

  end

  def destroy


    log = TimeLog.find(params[:id])

    user = log.user
    date = log.bill_date
    log.destroy
    redirect_to time_logs_path(:user_id => user, :bill_date => date)
  end

end
