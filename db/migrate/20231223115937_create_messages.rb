class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.datetime :created_time
      t.datetime :updated_time, null: true
    end
  end
end
