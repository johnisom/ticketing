json.extract! ticket, :id, :name, :body, :status, :project_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
