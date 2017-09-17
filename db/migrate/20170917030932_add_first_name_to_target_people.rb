class AddFirstNameToTargetPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :target_people, :first_name, :string
  end
end
