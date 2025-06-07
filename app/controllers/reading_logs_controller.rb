class ReadingLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:create, :destroy]

  def create
    @reading_log = current_user.reading_logs.build(book: @book, read_at: Time.current)
    
    if @reading_log.save
      redirect_to @book, notice: '読了記録を追加しました！'
    else
      redirect_to @book, alert: @reading_log.errors.full_messages.first
    end
  end

  def destroy
    @reading_log = current_user.reading_logs.find(params[:id])
    
    if @reading_log&.destroy
      # Check where the request came from to determine redirect destination
      if request.referer&.include?('/reading_logs')
        redirect_to reading_logs_path, notice: '読了記録を削除しました。'
      else
        redirect_to @book, notice: '読了記録を削除しました。'
      end
    else
      # Redirect back to where they came from
      redirect_back(fallback_location: @book, alert: '読了記録が見つかりませんでした。')
    end
  end

  def index
    @reading_logs = current_user.reading_logs.includes(:book).recent
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end