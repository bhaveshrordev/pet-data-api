class RenameDogsToPets < ActiveRecord::Migration[6.0]
  def change
    rename_table :dogs, :pets
  end
end
