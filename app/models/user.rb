class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { minimum: 2, maximum: 20 }
  
  # Reading logs associations
  has_many :reading_logs, dependent: :destroy
  has_many :read_books, through: :reading_logs, source: :book

  def total_words_read
    reading_logs.joins(:book).sum('books.word_count_avg')
  end

  def books_read_count
    reading_logs.count
  end

  def unique_books_read_count
    reading_logs.joins(:book).distinct.count('books.id')
  end
end
