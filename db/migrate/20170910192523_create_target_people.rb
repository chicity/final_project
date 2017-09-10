class CreateTargetPeople < ActiveRecord::Migration[5.0]
  def change
    create_table :target_people do |t|
      t.integer :person_id
      t.integer :user_id
      t.integer :belief_id
      t.integer :priority_order
      t.text :rationale

      t.timestamps

    end
  end
end
