class AddStopFlagToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :stop_flag, :boolean, default: false

  end
end
