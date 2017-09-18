class AddTargetOrganizationIdToBeliefs < ActiveRecord::Migration[5.1]
  def change
    add_column :beliefs, :target_organization_id, :integer
  end
end
