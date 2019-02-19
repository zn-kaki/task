class CreateMamos < ActiveRecord::Migration[5.2]
  def change
    create_table :mamos do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
