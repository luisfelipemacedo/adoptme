class ChangeToOwnerInAdoption < ActiveRecord::Migration[7.0]
  def change
    rename_column :adoptions, :user_id, :owner_id
  end
end
