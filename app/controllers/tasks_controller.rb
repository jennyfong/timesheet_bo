class TasksController < ApplicationController
  def index
    params[:user_id] = 1

    @date = Date.current
    @user = User.find(params[:user_id])
    @tasks = Task.all(:conditions => ["date = ? and user_id =? ", @date, @user], :order => "start_time ASC")

    @task = Task.new(:user => @user, :date => @date)

  end

  def new

  end

  def create
    if Task.create(params[:task])
      redirect_to tasks_url(:user_id => params[:task][:user_id], :date => params[:task][:date])
    else
      render tasks_url
    end

  end

end
