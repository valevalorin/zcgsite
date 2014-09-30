class CreateEventDays < ActiveRecord::Migration
  def change
    create_table :event_days do |t|
      t.date :date
      t.string :icon

      t.timestamps
    end
  end
end
