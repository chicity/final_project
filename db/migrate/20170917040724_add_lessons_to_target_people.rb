class AddLessonsToTargetPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :target_people, :lessons, :text
  end
end
