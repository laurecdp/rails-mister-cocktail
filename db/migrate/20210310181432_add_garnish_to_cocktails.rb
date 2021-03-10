class AddGarnishToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :garnish, :string
  end
end
