class OperationPlansController < ApplicationController

  def new
    @impulse_purchase = ImpulsePurchase.find(params[:impulse_purchase_id])
    @operation_plan = OperationPlan.new
  end

  def create
    @impulse_purchase = ImpulsePurchase.find(params[:impulse_purchase_id])
    @operation_plan = OperationPlan.new(operation_plan_params)
    @operation_plan.impulse_purchase_id = @impulse_purchase.id
    if @operation_plan.save
      flash[:notice] = "保存しました"
      redirect_to impulse_purchase_path(@impulse_purchase)
    else
      flash[:alert] = "保存できません"
      render :new, status: :unprocessable_entity
    end
  end

  private
    def set_operation_plan
      @operation_plan = current_user.operation_plan.find(params[:id])
    end

    def operation_plan_params
      params.require(:operation_plan).permit(:task, :work_time, :stamp).merge(impulse_purchase_id: params[:board_id]) 
    end
end
