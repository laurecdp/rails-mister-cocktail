class AddAmountToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :amount, :string
  end
end
