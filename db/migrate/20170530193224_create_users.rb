class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :second_name
      t.string :nickname
      t.string :phone
      t.string :email
      t.string :role
      t.string :position
      t.timestamps null: false
    end
  end
end
