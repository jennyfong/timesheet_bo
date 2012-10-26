class TimeLogsController < ApplicationController
#  before_filter :ensure_signed_in

  def index
    params[:user_id] = 1
    @user = params[:user_id].blank? ? current_user : User.find(params[:user_id])
    @bill_dates = BillDate.all
    @date = BillDate.find_by_date(params[:date]) if params[:date]
    @date ||= BillDate.find_or_create_by_date(:date => Date.current)

    @time_logs = @date.time_logs.order("start_time ASC")

    @time_log = TimeLog.new(:bill_date => @date)

  end

  def new

  end

  def create

    params[:time_log][:start_time] ="#{params[:hours]}:#{params[:minutes]}"
    @time_log = TimeLog.create(params[:time_log])

    if @time_log.valid?
      redirect_to time_logs_path(:bill_date => params[:time_log][:bill_date])
    else
      flash[:warning] = "There was a problem #{@time_log.errors.full_messages}"
      @date = @time_log.bill_date
      @bill_dates = BillDate.all
      @time_logs = @date.time_logs
      render :action => :index
    end

  end

  def destroy
    log = TimeLog.find(params[:id])
    date = log.bill_date
    log.destroy
    redirect_to time_logs_path(:bill_date => date)
  end

  def finish

  end

end
