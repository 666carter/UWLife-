class RenameAndDeleteTiming2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :carpools, :when, :time
  end
end
