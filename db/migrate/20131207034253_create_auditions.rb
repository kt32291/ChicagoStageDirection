class CreateAuditions < ActiveRecord::Migration
  def change
    create_table :auditions do |t|
      t.string :name
      t.date :post_date
      t.string :audition_date
      t.text :description
      t.integer :company_id

      t.timestamps
    end
  end
end
