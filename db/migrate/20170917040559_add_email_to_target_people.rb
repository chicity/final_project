class AddEmailToTargetPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :target_people, :email, :string
  end
end
