class AddMessToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :mess, foreign_key: true
  end
end
