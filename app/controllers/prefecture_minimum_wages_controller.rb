class PrefectureMinimumWagesController < ApplicationController
  
  def index
    # @prefecture_minimum_wages = prefecture_minimum_wages.all.order(created_at: :desc)
  end

  def new
    @prefecture_minimum_wages = PrefectureMinimumWage.new
  end

  
  private

  def set_impulse_purchase
    # @impulse_purchase = current_user.impulse_purchases.find(params[:id])
  end

  def impulse_purchase_params
    # params.require(:impulse_purchase).permit(:impulse_purchase_id, :title, :operating_time)
  end
end