class CreateGuessCriteria < ActiveRecord::Migration[5.1]
  def change
    create_table :guess_criteria do |t|
      t.float :height
      t.float :weight

      t.timestamps
    end
  end
end
