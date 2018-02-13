class CreateGuessConfirmations < ActiveRecord::Migration[5.1]
  def change
    create_table :guess_confirmations do |t|
      t.float :height
      t.float :weight
      t.string :algorithm
      t.boolean :is_correct
      t.string :guess

      t.timestamps
    end
  end
end
