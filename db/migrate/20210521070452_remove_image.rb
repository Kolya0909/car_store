class RemoveImage < ActiveRecord::Migration[6.1]
  def change
    remove_column('cars', :image)
  end
end
