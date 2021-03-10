class AddLabelToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :label, :string
  end
end
