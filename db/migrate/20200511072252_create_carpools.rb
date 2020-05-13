class CreateCarpools < ActiveRecord::Migration[6.0]
  def change
    create_table :carpools do |t|
      t.boolean :doorToDoor
      t.boolean :individual
      t.boolean :smoking
      t.string :gender
      t.integer :seats
      t.string :locationFrom
      t.string :locationTo
      t.string :price
      t.datetime :time
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
