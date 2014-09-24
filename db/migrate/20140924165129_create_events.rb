class CreateEvents < ActiveRecord::Migration
  def change
  	create_table :event_days do |t|
  		t.date :date
  		t.string :icon
  	end

    create_table :events do |t|
    	t.belongs_to :event_day
    	t.string :title
    	t.time :time
    	t.string :icon
    end
  end
end
