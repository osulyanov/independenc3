class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :vertical
      t.integer :state, null: false, default: 0

      t.timestamps
    end
  end
end
