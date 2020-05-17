class AddTimeCarpool < ActiveRecord::Migration[6.0]
  def change
    add_column :carpools, :when, :string
  end
end
