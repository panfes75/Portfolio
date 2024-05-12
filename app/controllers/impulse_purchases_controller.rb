class ImpulsePurchasesController < ApplicationController
  def index
    # @prods = ImpulsePurchase.all.includes(:user).order(created_at: :desc)
  end

  def new
    @prod = ImpulsePurchase.new
  end

  def create
    @prod = current_user.impulse_purchases.build(impulse_purchase_params)
    if @prod.save
      redirect_to show_impulse_purchase_path, notice: "Message"
    else
      flash.now['danger'] = t('defaults.message.not_created')
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @prod = ImpulsePurchase.find(params[:id])
    @purchase_amount = @prod["purchase_amount"]
    @hourly_wage = @prod["hourly_wage"]
    @operating_time = @purchase_amount / @hourly_wage
  end

  private

  def impulse_purchase_params
    params.require(:impulse_purchase).permit(:purchase_amount, :hourly_wage)
  end
end
