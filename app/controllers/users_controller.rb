class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    User.create(params)
  end

  def edit
  end

end
