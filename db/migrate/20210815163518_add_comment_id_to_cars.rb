class AddCommentIdToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :comment_id, :integer
  end
end
