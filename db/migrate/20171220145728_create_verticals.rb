class CreateVerticals < ActiveRecord::Migration[5.1]
  def change
    create_table :verticals do |t|
      t.string :name

      t.timestamps
    end
  end
end
