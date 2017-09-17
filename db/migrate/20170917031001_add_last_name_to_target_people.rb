class AddLastNameToTargetPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :target_people, :last_name, :string
  end
end
