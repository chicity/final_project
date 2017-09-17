class AddLinkedinUrlToTargetPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :target_people, :linkedin_url, :string
  end
end
