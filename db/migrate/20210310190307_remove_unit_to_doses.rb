class RemoveUnitToDoses < ActiveRecord::Migration[6.0]
  def change
    remove_column :doses, :unit, :float
  end
end
