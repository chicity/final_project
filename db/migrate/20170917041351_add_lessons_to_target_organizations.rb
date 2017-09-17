class AddLessonsToTargetOrganizations < ActiveRecord::Migration[5.1]
  def change
    add_column :target_organizations, :lessons, :text
  end
end
