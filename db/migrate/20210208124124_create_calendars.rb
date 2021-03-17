class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.string :work_content
      t.integer :target_time
      t.integer :learning_time, :default => 0
      t.integer :user_id
      t.datetime :start_time
      
      t.timestamps
    end
  end
end
