class ChangeStatusToBooleanInAdoptions < ActiveRecord::Migration[7.0]
  def change
    remove_column :adoptions, :status
    add_column :adoptions, :status, :boolean, default: false
  end
end
