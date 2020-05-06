class Ticket < ApplicationRecord
  STATUSES = %w[new blocked in_progress fixed]

  validates :status, inclusion: { in: STATUSES }
  validates :name, presence: true, length: { minimum: 3 }
  validates :project_id, presence: true

  has_and_belongs_to_many :tags
  has_many :comments
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true
  belongs_to :project
end
