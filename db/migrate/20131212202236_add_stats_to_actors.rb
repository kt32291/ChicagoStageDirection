class AddStatsToActors < ActiveRecord::Migration
  def change
    add_column :actors, :hair, :string
    add_column :actors, :eyes, :string
  end
end
