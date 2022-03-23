class FavoritesController < ApplicationController

  def create
    record = Record.find(params[:record_id])
    favorite = current_user.favorites.new(record_id: record.id)
    favorite.save
    redirect_to users_path
  end

  def destroy
    record = Record.find(params[:record_id])
    favorite = current_user.favorites.find_by(record_id: record.id)
    favorite.destroy
    redirect_to users_path
  end

end
