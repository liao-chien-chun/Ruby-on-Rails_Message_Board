class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :account, null:false, index: { unique: true }
      t.string :pwd 
      t.date :birthday
      t.integer :age, unsigned: true
      t.string :email, null:false, index: { unique: true }
      t.timestamps
    end
  end
end
