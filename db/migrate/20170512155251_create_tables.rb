class CreateTables < ActiveRecord::Migration[5.1]
  def change

    create_table(:brands) do |t|
      t.column(:name, :string)
      t.column(:quantity, :int)
      t.column(:new_brand, :boolean)
      t.column(:sold_out, :boolean)
      t.column(:price, :decimal, :precision => 15, :scale => 2)

      t.timestamps()
    end

    create_table(:stores) do |t|
      t.column(:name, :string)
      t.column(:street, :string)
      t.column(:city, :string)
      t.column(:state, :string)
      t.column(:zipcode, :int)

      t.timestamps()
    end

    create_table(:brands_stores) do |t|
      t.column(:brand_id, :int)
      t.column(:stroe_id, :int)

      t.timestamps()
    end

  end
end
