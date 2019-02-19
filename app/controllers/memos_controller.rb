class MemosController < ApplicationController
  def index
  end

  def create
    memo = Memo.new(memo_params)
    memo.save!
    redirect_to memos_url, notice: "メモ「#{memo.name}」を登録しました。"
  end

  def show
  end

  def new
    @memo = Memo.new
  end

  def edit
  end

  private

  def memo_params
    params.require(:memo).permit(:name, :description)
  end
end
