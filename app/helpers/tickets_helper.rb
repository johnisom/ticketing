module TicketsHelper
  def list_tags(ticket)
    ticket.tags.map(&:name).join(', ')
  end

  def pretty_status(ticket)
    ticket.status.titleize
  end
end
