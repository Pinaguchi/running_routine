class RecordsController < ApplicationController
  before_action :set_beginning_of_week
  before_action :authenticate_user!

  def index
    @records = current_user.record.all
  end

  def new
    @record = Record.new
  end

  def create
    start_time = DateTime.current
    today = Date.current
    record =  current_user.record.find_by(start_date: today)
    if record
      record.update(starting_time: start_time)
    else
      record = current_user.record.create({ starting_time: start_time, start_date: today})
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
    if @record.update(stoped_time: DateTime.current)
      redirect_to records_my_page_path
    else
      render :edit
    end
  end

  def show
    @record = Record.find_by(user_id: current_user.id, start_date: Date.current)
  end

  private

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end

end
