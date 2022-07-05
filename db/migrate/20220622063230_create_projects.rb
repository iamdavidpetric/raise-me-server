class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :goal
      t.integer :fee
      t.date :deadline
      t.string :name
      t.string :statement
      t.string :description
      t.text :images, array: true, default: []

      t.timestamps
    end
  end
end
