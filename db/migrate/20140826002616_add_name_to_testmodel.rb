class AddNameToTestmodel < ActiveRecord::Migration
  def change
    add_column :testmodels, :name, :string
  end
end
