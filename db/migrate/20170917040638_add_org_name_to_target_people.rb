class AddOrgNameToTargetPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :target_people, :org_name, :string
  end
end
