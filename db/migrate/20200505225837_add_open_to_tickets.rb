class AddOpenToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :open, :boolean, default: true
  end
end
