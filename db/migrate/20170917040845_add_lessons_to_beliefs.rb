class AddLessonsToBeliefs < ActiveRecord::Migration[5.1]
  def change
    add_column :beliefs, :lessons, :text
  end
end
