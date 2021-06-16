class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :breed
      t.string :name
      t.string :date_of_birth
      t.string :color
      t.string :sex

      t.timestamps
    end
  end
end
