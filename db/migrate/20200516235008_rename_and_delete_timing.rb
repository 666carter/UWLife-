class RenameAndDeleteTiming < ActiveRecord::Migration[6.0]
  def change
    remove_column :carpools, :time
  end
end
