class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :actor_id
      t.integer :audition_id

      t.timestamps
    end
  end
end
