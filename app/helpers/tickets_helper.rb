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

  def project_filter_select
    projects = Project.order(:name).map { |p| [p.name, p.id] }
    project_opts = options_for_select(projects, params[:project_id])
    select_tag :project_id, project_opts, include_blank: 'All Projects'
  end

  def status_filter_select
    statuses = ticket_statuses
    status_opts = options_for_select(statuses, params[:status])
    select_tag :status, status_opts, include_blank: 'Any Status'
  end

  def tag_filter_select
    tags = Tag.order(:name).map { |t| [t.name, t.id] }
    tag_opts = options_for_select(tags, params[:tag_id])
    select_tag :tag_id, tag_opts, include_blank: '-'
  end
end
