class CreateMesses < ActiveRecord::Migration[5.1]
  def change
    create_table :messes do |t|
      t.string :name
      t.string :address
      t.string :postcode

      t.timestamps
    end
  end
end
