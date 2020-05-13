class CreateHousing < ActiveRecord::Migration[6.0]
  def change
    create_table :housings do |t|
      t.string :price
      t.string :address
      t.string :from
      t.string :to
      t.integer :rooms
      t.string :description
      t.string :requirement
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
