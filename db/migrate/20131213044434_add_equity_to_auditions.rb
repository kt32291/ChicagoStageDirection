class AddEquityToAuditions < ActiveRecord::Migration
  def change
    add_column :auditions, :equity, :string
  end
end
