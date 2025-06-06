class Book < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 255 }
  validates :yomiyasusa_level, presence: true
  validates :word_count, presence: true
  validates :isbn, uniqueness: { allow_blank: true }
  validates :author, presence: true, length: { minimum: 1, maximum: 255 }

  # Reading logs associations
  has_many :reading_logs, dependent: :destroy
  has_many :readers, through: :reading_logs, source: :user

  # Callbacks to parse ranges and calculate min/max/avg values
  before_save :parse_yl_range
  before_save :parse_word_count_range

  scope :by_yl_range, ->(min, max) { where("yl_min <= ? AND yl_max >= ?", max, min) }
  scope :by_word_count_range, ->(min, max) { where("word_count_min <= ? AND word_count_max >= ?", max, min) }
  scope :search_by_title, ->(query) { where("title ILIKE ?", "%#{query}%") }

  def read_by?(user)
    return false unless user
    reading_logs.exists?(user: user)
  end

  def times_read_by(user)
    return 0 unless user
    reading_logs.where(user: user).count
  end

  def yl_display
    return yomiyasusa_level unless yomiyasusa_level.to_s.include?('-')
    yomiyasusa_level
  end

  def word_count_display
    return word_count unless word_count.to_s.include?('-')
    word_count
  end

  # Get average word count for statistics calculation
  def average_word_count
    word_count_avg || word_count_min || word_count.to_i
  end

  private

  def parse_yl_range
    return unless yomiyasusa_level.present?
    
    if yomiyasusa_level.to_s.include?('-')
      min, max = yomiyasusa_level.to_s.split('-').map(&:to_f)
      self.yl_min = min
      self.yl_max = max
    else
      level = yomiyasusa_level.to_f
      self.yl_min = level
      self.yl_max = level
    end
  end

  def parse_word_count_range
    return unless word_count.present?
    
    if word_count.to_s.include?('-')
      min, max = word_count.to_s.split('-').map(&:to_i)
      self.word_count_min = min
      self.word_count_max = max
      self.word_count_avg = (min + max) / 2
    else
      count = word_count.to_i
      self.word_count_min = count
      self.word_count_max = count
      self.word_count_avg = count
    end
  end
end
