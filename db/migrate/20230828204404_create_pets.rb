class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.date :birthday
      t.text :description
      t.string :category
      t.string :breed
      t.references :seller, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
