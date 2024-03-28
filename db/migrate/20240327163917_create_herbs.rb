class CreateHerbs < ActiveRecord::Migration[7.0]
  def change
    create_table :herbs do |t|
      t.string :name
      t.string :watered

      t.timestamps
    end
  end
end
