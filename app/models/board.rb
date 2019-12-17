class Board < ApplicationRecord
  has_many :cards, dependent: :destroy

  validates :title, length: { minimum: 3 }

  def to_s
    title
  end

  def last_change
    return updated_at if cards.count.zero?
    [updated_at, cards.maximum(:updated_at)].max
  end  
end
