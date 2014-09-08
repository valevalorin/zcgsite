class CreateTestmodels < ActiveRecord::Migration
  def change
    create_table :testmodels do |t|

      t.timestamps
    end
  end
end
