class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :phone
      t.string :email
      t.string :logo

      t.timestamps
    end
  end
end
