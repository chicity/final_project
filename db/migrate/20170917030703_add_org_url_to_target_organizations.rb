class AddOrgUrlToTargetOrganizations < ActiveRecord::Migration[5.1]
  def change
    add_column :target_organizations, :org_url, :string
  end
end
