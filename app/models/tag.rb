class Tag < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :tickets

  def self.tickets_counts
    connection.exec_query <<~SQL
      SELECT tags.name, tags.id, COUNT(tags_tickets.tag_id)
        FROM tags
        LEFT OUTER JOIN tags_tickets
             ON tags.id = tags_tickets.tag_id
       GROUP BY tags.id
       ORDER BY tags.name;
    SQL
  end
end
