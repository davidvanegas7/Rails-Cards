class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.references :card, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :sum_total
      t.integer :plays
      t.integer :prom

      t.timestamps
    end
  end
end
