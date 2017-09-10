class CreateScheduleTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :schedule_tasks do |t|
      t.integer :belief_id
      t.integer :user_id
      t.integer :target_people_id
      t.datetime :scheduled_datetime
      t.datetime :completion_datetime
      t.text :body
      t.boolean :complete, null: false, default: false

      t.timestamps

    end
  end
end
