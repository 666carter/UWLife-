class EditHousingTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :housings, :rooms, :howManyRooms
    add_column :housings, :time, :string
  end
end
