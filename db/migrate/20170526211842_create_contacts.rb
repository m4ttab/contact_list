class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :surname
      t.string :phone
      t.string :address
      t.string :email
      t.boolean :important

      t.timestamps
    end
  end
end
