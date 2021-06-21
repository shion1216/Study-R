class AddMemoToCalendars < ActiveRecord::Migration[5.2]
  def change
    add_column :calendars, :memo, :text
  end
end
