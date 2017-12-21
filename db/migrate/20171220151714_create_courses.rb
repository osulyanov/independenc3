class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :author
      t.references :category, index: true
      t.integer :state, null: false, default: 0

      t.timestamps
    end
  end
end
