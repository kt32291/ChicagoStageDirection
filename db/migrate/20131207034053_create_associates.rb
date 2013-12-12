class CreateAssociates < ActiveRecord::Migration
  def change
    create_table :associates do |t|
      t.string :name
      t.string :title
      t.integer :company_id
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
