class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :author_id
      t.text :html

      t.timestamps
    end
  end
end
