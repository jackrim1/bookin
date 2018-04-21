class AddTimesToMess < ActiveRecord::Migration[5.1]
  def change
    add_column :messes, :break_start, :time
    add_column :messes, :break_finish, :time
    add_column :messes, :break_cutoff, :time
    add_column :messes, :lunch_start, :time
    add_column :messes, :lunch_finish, :time
    add_column :messes, :lunch_cutoff, :time
    add_column :messes, :dinner_start, :time
    add_column :messes, :dinner_finish, :time
    add_column :messes, :dinner_cutoff, :time
  end
end
