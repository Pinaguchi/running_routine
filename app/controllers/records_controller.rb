class RecordsController < ApplicationController

  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    start_time = DateTime.current
    today = Date.current
    current_user.record.create({ start_time: start_time, start_date: today})
    redirect_to edit_record_path
  end

  def edit
    @record = Record.find_by(user_id: current_user.id, start_date: Date.current)
    unless @record.user == current_user
      redirect_to records_path
    end
  end

  def update
    @record = Record.find_by(user_id: current_user.id, start_date: Date.current)
    if @record.update(stoped_time: DateTime.current)
      redirect_to edit_record_path(@record.id)
    else
      render :edit
    end
  end

end
