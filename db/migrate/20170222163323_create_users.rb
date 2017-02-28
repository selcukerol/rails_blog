class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.datetime :dob
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
