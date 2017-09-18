class AddPositionToTargetOrganization < ActiveRecord::Migration[5.1]
  def change
    add_column :target_organizations, :position, :integer
  end
end
