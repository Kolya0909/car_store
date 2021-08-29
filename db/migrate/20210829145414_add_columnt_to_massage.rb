class AddColumntToMassage < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :content, :string
    add_column :messages, :sender_id, :integer
    add_column :messages, :recipient_id, :integer
  end
end
