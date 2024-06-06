class OperationPlansController < ApplicationController
  before_action :set_operation_plan, only: %i[update]
  before_action :set_impulse_purchase, only: %i[new create edit update]
  def new
    @operation_plan = OperationPlan.new
  end

  def create
    @operation_plan = OperationPlan.new(operation_plan_params)
    @operation_plan.impulse_purchase_id = @impulse_purchase.id
    if @operation_plan.save
      flash[:notice] = '保存しました'
      redirect_to impulse_purchase_path(@operation_plan.impulse_purchase_id)
    else
      flash[:alert] = '保存できません'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @operation_plan = @impulse_purchase.operation_plan
  end

  def update
    if @operation_plan.update(operation_plan_params)
      flash[:notice] = '更新しました'
      redirect_to impulse_purchase_path(@impulse_purchase)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_operation_plan
    @operation_plan = OperationPlan.find(params[:id])
  end

  def set_impulse_purchase
    @impulse_purchase = ImpulsePurchase.find(params[:impulse_purchase_id])
  end

  def operation_plan_params
    params.require(:operation_plan).permit(:task, :work_time, :stamp).merge(impulse_purchase_id: params[:impulse_purchase_id])
  end
end
