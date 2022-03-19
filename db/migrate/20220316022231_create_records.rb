class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|

      t.datetime :starting_time
      t.datetime :stoped_time
      t.integer  :user_id
      t.date     :start_date

      t.timestamps
    end
  end
end
