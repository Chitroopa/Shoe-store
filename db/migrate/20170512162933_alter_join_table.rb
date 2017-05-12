class AlterJoinTable < ActiveRecord::Migration[5.1]
  def change
    remove_column(:brands_stores, :stroe_id, :int)
  end
end
