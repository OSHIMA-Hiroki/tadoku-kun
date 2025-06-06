class ReadingLog < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :read_at, presence: true
  validates :user_id, uniqueness: { scope: :book_id, message: "この本はすでに読了済みです" }

  scope :recent, -> { order(read_at: :desc) }
  scope :by_month, ->(date) { where(read_at: date.beginning_of_month..date.end_of_month) }

  def total_words
    book.word_count
  end
end
