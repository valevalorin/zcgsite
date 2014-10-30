class AddTitleImageToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :title_image, :string
  end
end
