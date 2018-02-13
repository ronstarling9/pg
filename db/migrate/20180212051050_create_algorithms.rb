class CreateAlgorithms < ActiveRecord::Migration[5.1]
  def change
    create_table :algorithms do |t|
      t.string :name, limit: 15
      t.integer :weight

      t.timestamps
    end
    add_index :algorithms, :name, unique: true
  end
end
