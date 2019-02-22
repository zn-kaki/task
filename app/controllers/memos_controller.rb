class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end

  def create
    @memo = Memo.new(memo_params)

    if @memo.save
      redirect_to @memo, notice: "メモ「#{@memo.name}」を登録しました。"
    else
      render :new
    end
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def new
    @memo = Memo.new
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    memo = Memo.find(params[:id])
    memo.update(memo_params)
    redirect_to memos_url, notice: "メモ#{memo.name}を更新しました。"
  end

  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
    redirect_to memos_url, notice: "メモ#{memo.name}を削除しました。"
  end

  private

  def memo_params
    params.require(:memo).permit(:name, :description)
  end
end
