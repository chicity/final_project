class AddOrgNameToTargetOrganizations < ActiveRecord::Migration[5.1]
  def change
    add_column :target_organizations, :org_name, :string
  end
end
