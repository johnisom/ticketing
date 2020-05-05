class Project < ApplicationRecord
  validates :name, presence: true
  has_many :tickets, dependent: :destroy

  def ticket_count
    tickets.size
  end

  def open_ticket_count
    Ticket.where(project: self, open: true).size
  end
end
