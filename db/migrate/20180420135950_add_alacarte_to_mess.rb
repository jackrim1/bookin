class AddAlacarteToMess < ActiveRecord::Migration[5.1]
  def change
    add_column :messes, :alacarte, :boolean
  end
end
