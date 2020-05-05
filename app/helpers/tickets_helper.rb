module TicketsHelper
  def list_tags(ticket)
    ticket.tags.map(&:name).join(', ')
  end
end
