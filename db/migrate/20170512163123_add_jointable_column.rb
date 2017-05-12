class AddJointableColumn < ActiveRecord::Migration[5.1]
  def change
    add_column(:brands_stores, :store_id, :int)
  end
end
