class MemosController < ApplicationController
  before_action :set_memo, only: [:show, :edit, :update, :destroy]
  def index
    @memos = current_user.memos.order(created_at: :desc)
  end

  def create
    @memo = current_user.memos.new(memo_params)

    if @memo.save
      redirect_to @memo, notice: "メモ「#{@memo.name}」を登録しました。"
    else
      render :new
    end
  end

  def show
  end

  def new
    @memo = Memo.new
  end

  def edit
  end

  def update
    @memo.update!(memo_params)
    redirect_to memos_url, notice: "メモ#{memo.name}を更新しました。"
  end

  def destroy
   @memo.destroy
    redirect_to memos_url, notice: "メモ#{memo.name}を削除しました。"
  end

  private

  def memo_params
    params.require(:memo).permit(:name, :description)
  end

  def set_memo
    @memo = current_user.memos.find(params[:id])
end
