class ChangeUserIdToCreatorId < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :user_id, :integer

    add_column :tickets, :creator_id, :integer
    add_foreign_key :tickets, :users, column: :creator_id
  end
end
