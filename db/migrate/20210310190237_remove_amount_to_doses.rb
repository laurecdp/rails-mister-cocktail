class RemoveAmountToDoses < ActiveRecord::Migration[6.0]
  def change
    remove_column :doses, :amount, :float
  end
end
