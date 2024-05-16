class ImpulsePurchasesController < ApplicationController
  before_action :set_impulse_purchase, only: %i[edit update destroy]
  skip_before_action :authenticate_user!, only: %i[new]
  def index
    @impulse_purchases = current_user.impulse_purchases.all.order(created_at: :desc)
  end

  def top
    @impulse_purchase = ImpulsePurchase.new
  end

  def new
    @impulse_purchase = ImpulsePurchase.new
  end

  def create
    merged_params = impulse_purchase_params.merge({
      purchase_amount: params[:purchase_amount],
      hourly_wage: params[:hourly_wage]
    })
    @impulse_purchase = current_user.impulse_purchases.build(merged_params)
    if params[:comp]
      @impulse_purchase.save
      flash[:notice] = "完成"
      redirect_to impulse_purchase_path(@impulse_purchase)
    elsif params[:shift]
      @impulse_purchase.save
      flash[:notice] = "シフト作るよ"
      redirect_to impulse_purchase_path(@impulse_purchase)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @impulse_purchase = ImpulsePurchase.find(params[:id])
  end

  def edit
    @impulse_purchase = current_user.impulse_purchases.find(params[:id])
  end

  def update
    merged_params = impulse_purchase_params.merge({
      purchase_amount: params[:purchase_amount],
      hourly_wage: params[:hourly_wage]
    })
    @impulse_purchase = current_user.impulse_purchases.find(params[:id])
    if params[:comp]
      @impulse_purchase.update(merged_params)
      flash[:notice] = "更新しました。"
      redirect_to impulse_purchase_path(@impulse_purchase)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    impulse_purchase = current_user.impulse_purchases.find(params[:id])
    impulse_purchase.destroy!
    flash[:notice] = "削除しました。"
    redirect_to impulse_purchases_path
  end

  private

  def set_impulse_purchase
    @impulse_purchase = current_user.impulse_purchases.find(params[:id])
  end

  def impulse_purchase_params
    params.require(:impulse_purchase).permit(:title, :operating_time)
  end
end
