class RecordsController < ApplicationController
  
  def index
    @records = Record.all
  end
  
  def new
    @record = Record.new
  end
  
  def create
    Record.create(record_parameter)
    redirect_to records_path
  end
  
  private
  
  def record_parameter
    params.require(:record).permit(:start_time, :stoped_time)  
  end
  
end
