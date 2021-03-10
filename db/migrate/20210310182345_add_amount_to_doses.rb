class AddAmountToDoses < ActiveRecord::Migration[6.0]
  def change
    add_column :doses, :amount, :float
  end
end
