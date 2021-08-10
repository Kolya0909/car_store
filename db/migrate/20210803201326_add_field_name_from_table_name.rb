class AddFieldNameFromTableName < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :car_id, :integer
  end
end
