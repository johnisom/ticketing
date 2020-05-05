class Tag < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :tickets

  def self.alphabetical
    all.sort_by(&:name)
  end

  def ticket_count
    tickets.size
  end
end
