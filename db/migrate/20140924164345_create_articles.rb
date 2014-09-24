class CreateArticles < ActiveRecord::Migration
  def change
  	create_table :authors do |t|
  		t.string :name
  		t.string :image
  		t.timestamps
  	end

    create_table :articles do |t|
    	t.belongs_to :author
    	t.string :title
    	t.text :html
    	t.timestamps
    end
  end
end
