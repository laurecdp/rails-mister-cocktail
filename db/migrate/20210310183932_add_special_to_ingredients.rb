class AddSpecialToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :special, :string
  end
end
