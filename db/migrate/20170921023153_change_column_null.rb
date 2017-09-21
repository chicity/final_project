class ChangeColumnNull < ActiveRecord::Migration[5.1]
  def change
    # change_column_null :beliefs, :body, false
    # change_column :beliefs, :body, :null => false
    change_column_default :beliefs, :body, from: true, to: false
  end
end
