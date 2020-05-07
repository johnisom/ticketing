module ApplicationHelper
  def ticket_statuses
    Ticket::STATUSES.map { |s| [s.titleize, s] }
  end
end
