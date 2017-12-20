class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    enable_extension('citext')

    create_table :users do |t|
      t.citext :email
      t.string :password_digest

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
