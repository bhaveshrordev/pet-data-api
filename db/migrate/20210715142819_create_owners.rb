class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.string :email
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
