class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      
      t.datetime :start_time
      t.datetime :stoped_time

      t.timestamps
    end
  end
end
