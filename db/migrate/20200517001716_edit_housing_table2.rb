class EditHousingTable2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :housings, :from
    remove_column :housings, :to
  end
end
