class Ticket < ApplicationRecord
  STATUSES = %w[new blocked in_progress fixed]

  validates :status, inclusion: { in: STATUSES }
  validates :name, presence: true, length: { minimum: 3 }
  validates :project_id, presence: true

  belongs_to :project
end
