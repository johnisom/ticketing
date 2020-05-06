class AddAssigneeIdToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :assignee_id, :integer
    add_foreign_key :tickets, :users, column: :assignee_id
  end
end
