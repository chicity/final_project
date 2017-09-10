class CreateTargetOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :target_organizations do |t|
      t.integer :user_id
      t.integer :org_id
      t.integer :priority_order

      t.timestamps

    end
  end
end
