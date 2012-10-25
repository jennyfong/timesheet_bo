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

    params[:time_log][:start_time] ="#{params[:hours]}:#{params[:minutes]}"
    @time_log = TimeLog.create(params[:time_log])

    if @time_log.valid?
      redirect_to time_logs_path(:user_id => params[:time_log][:user_id], :bill_date => params[:time_log][:bill_date])
    else
      flash[:warning] = "There was a problem #{@time_log.errors.full_messages}"
      @date = @time_log.bill_date
      @time_logs = @date.time_logs.find_all_by_user_id(@time_log.user_id)
      render :action => :index
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
