class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :title
      t.string :audio
      t.string :desc

      t.timestamps
    end
  end
end
