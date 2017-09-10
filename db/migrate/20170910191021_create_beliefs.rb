class CreateBeliefs < ActiveRecord::Migration[5.0]
  def change
    create_table :beliefs do |t|
      t.integer :user_id
      t.integer :org_id
      t.text :body
      t.integer :priority_order
      t.boolean :confirmed_status

      t.timestamps

    end
  end
end
