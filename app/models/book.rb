class Book < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 255 }
  validates :yomiyasusa_level, presence: true, 
            numericality: { greater_than: 0, less_than_or_equal_to: 9.9 }
  validates :word_count, presence: true, 
            numericality: { greater_than: 0, only_integer: true }
  validates :isbn, uniqueness: { allow_blank: true }
  validates :author, presence: true, length: { minimum: 1, maximum: 255 }

  # Reading logs associations
  has_many :reading_logs, dependent: :destroy
  has_many :readers, through: :reading_logs, source: :user

  scope :by_level, ->(level) { where(yomiyasusa_level: level) }
  scope :by_word_count_range, ->(min, max) { where(word_count: min..max) }
  scope :search_by_title, ->(query) { where("title ILIKE ?", "%#{query}%") }

  def read_by?(user)
    return false unless user
    reading_logs.exists?(user: user)
  end
end
