class TasksController < ApplicationController
  before_filter :ensure_signed_in

  def index

    @date = BillDate.find_by_date(Date.current)
    @user = params[:user_id].blank? ? current_user : User.find(params[:user_id])
    @tasks = Task.all(:conditions => ["bill_date_id = ? and user_id =? ", @date, @user], :order => "start_time ASC")

    @task = Task.new(:user => @user, :bill_date => @date)

  end

  def new

  end

  def create
    if Task.create(params[:task])
      redirect_to tasks_url(:user_id => params[:task][:user_id], :date => params[:task][:date])
    else
      flash[:warning] = "There was a problem"
      render tasks_url
    end

  end

end
