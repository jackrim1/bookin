class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :mess, foreign_key: true
      t.datetime :start_time
      t.datetime :finish_time
      t.datetime :bookin_time_start
      t.datetime :bookin_time_cutoff
      t.string :title

      t.timestamps
    end
  end
end
