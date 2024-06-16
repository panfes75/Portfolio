class ImpulsePurchasesController < ApplicationController
  before_action :set_impulse_purchase, only: %i[edit update destroy]
  skip_before_action :authenticate_user!, only: %i[new]
  def index
    @impulse_purchases = current_user.impulse_purchases.all.order(created_at: :desc)
  end

  def new
    @impulse_purchase = ImpulsePurchase.new
  end

  def create
    @impulse_purchase = current_user.impulse_purchases.build(impulse_purchase_params)
    if @impulse_purchase.save
      if params[:comp]
        flash[:notice] = '完成しました'
        redirect_to impulse_purchase_path(@impulse_purchase)
      elsif params[:shift]
        flash[:notice] = 'スタンプカードを作成します'
        redirect_to new_impulse_purchase_operation_plan_path(@impulse_purchase)
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @impulse_purchase = ImpulsePurchase.where(id: params[:id])
  end

  def edit; end

  def update
    if @impulse_purchase.update(impulse_purchase_params)
      if params[:comp]
        if @impulse_purchase.operation_plan.present?
          @impulse_purchase.operation_plan.destroy!
        end
        flash[:notice] = '更新しました'
        redirect_to impulse_purchase_path(@impulse_purchase)
      elsif params[:shift]
        flash[:notice] = 'スタンプカードを作成します'
        if @impulse_purchase.operation_plan.present?
          redirect_to edit_impulse_purchase_operation_plan_path(@impulse_purchase)
        else
          redirect_to new_impulse_purchase_operation_plan_path(@impulse_purchase)
        end
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @impulse_purchase.destroy!
    flash[:notice] = '削除しました'
    redirect_to impulse_purchases_path
  end

  private

  def set_impulse_purchase
    @impulse_purchase = current_user.impulse_purchases.find(params[:id])
  end

  def impulse_purchase_params
    params.require(:impulse_purchase).permit(:impulse_purchase_id, :title, :purchase_amount, :hourly_wage, :operating_time)
  end
end
