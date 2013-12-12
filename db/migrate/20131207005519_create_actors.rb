class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :first_name
      t.string :last_name
      t.string :equity
      t.integer :height
      t.integer :weight
      t.string :headshot
      t.string :resume
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
