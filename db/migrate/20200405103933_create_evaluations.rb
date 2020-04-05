class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer :user, null: false
      t.text :evaluation, null: false
      t.timestamps
    end
  end
end
