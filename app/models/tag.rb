class Tag < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :tickets

  def ticket_count
    tickets.size
  end
end
