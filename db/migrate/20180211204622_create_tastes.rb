class CreateTastes < ActiveRecord::Migration[5.1]
  def change
    create_table :tastes do |t|
      t.float :height
      t.float :weight
      t.integer :preference

      t.timestamps
    end
  end
end
