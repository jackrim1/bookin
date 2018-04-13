class AddMessToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :mess, foreign_key: true
  end
end
