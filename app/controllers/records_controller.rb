class RecordsController < ApplicationController
  before_action :set_beginning_of_week
  before_action :authenticate_user!

  def index
    @records = current_user.records
  end

  def new
   if current_user.records.exists?(start_date: Date.current)
       record = current_user.records.find_by(start_date: Date.current)
       redirect_to edit_record_path(record.id)
   else
    @record = Record.new
   end
  end

  def create
      start_time = DateTime.current
      today = Date.current
      record =  current_user.records.find_by(start_date: today)
      if record
        record.update(starting_time: start_time)
      else
        record = current_user.records.create({ starting_time: start_time, start_date: today})
      end
      redirect_to edit_record_path(record.id)
  end

  def edit
    @record = Record.find_by(user_id: current_user.id, start_date: Date.current)
    unless @record.user == current_user
      redirect_to records_path
    end
  end

  def update
    @record = Record.find_by(user_id: current_user.id, start_date: Date.current)
    if @record.update(stoped_time: DateTime.current, stop_flag: true)
      redirect_to records_my_page_path
    else
      render :edit
    end
  end

  def show
    @record = Record.find(params[:id])
    @records = current_user.records.page(params[:page]).order(created_at: :desc)
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to records_my_page_path
  end

  private

  def record_params
    params.require(:record).permit(:starting_time, :stoped_time, :user_id)
  end

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end

end
