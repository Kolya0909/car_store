class RemoveCommentIdFromCars < ActiveRecord::Migration[6.1]
  def change
    remove_column :cars, :comment_id
  end
end
