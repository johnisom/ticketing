module TicketsHelper
  def show_tags(ticket)
    if ticket.tags.size.zero?
      '-'
    else
      ticket.tags.map(&:name).join(', ')
    end
  end

  def show_status(ticket)
    ticket.status.titleize
  end

  def show_assignee(ticket)
    if ticket.assignee
      ticket.assignee.name
    else
       '-'
    end
  end
end
