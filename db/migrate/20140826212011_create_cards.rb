class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end
