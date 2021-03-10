class AddPreparationToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :preparation, :string
  end
end
