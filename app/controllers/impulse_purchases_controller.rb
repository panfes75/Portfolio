class ImpulsePurchasesController < ApplicationController
  def index
    # @@impulse_purchases = ImpulsePurchase.all.includes(:user).order(created_at: :desc)
  end

  def new
    @impulse_purchase = ImpulsePurchase.new
  end

  def create
    @impulse_purchase = current_user.impulse_purchases.build(impulse_purchase_params)
    if @impulse_purchase.save
      format.turbo_stream { flash[:success] = "成功しました" }
      redirect_to impulse_purchase_path(@impulse_purchase)
    else
      flash.now[:warning] = "投稿に失敗しました" 
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def impulse_purchase_params
    params.require(:impulse_purchase).permit(:title, :purchase_amount, :hourly_wage, :operating_time)
  end
end
