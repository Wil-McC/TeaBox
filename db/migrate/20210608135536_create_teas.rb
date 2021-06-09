class CreateTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :teas do |t|
      t.string :title
      t.integer :temp_c
      t.float :brew_for

      t.timestamps
    end
  end
end
