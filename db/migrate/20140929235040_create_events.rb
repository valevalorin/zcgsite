class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :day_id
      t.time :time
      t.string :icon

      t.timestamps
    end
  end
end
