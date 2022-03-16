class UsersController < ApplicationController
  #before_action :authenticate_user!
  
  def index
    
  end
  
  def show
    @time_records = TimeRecord.all
  end

  def edit
  end
end
