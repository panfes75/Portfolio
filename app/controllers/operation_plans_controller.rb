class OperationPlansController < ApplicationController
  before_action :set_operation_plan, only: %i[ edit update ]

  def new
    @impulse_purchase = ImpulsePurchase.find(params[:impulse_purchase_id])
    @operation_plan = OperationPlan.new
  end

  def create
    @impulse_purchase = ImpulsePurchase.find(params[:impulse_purchase_id])
    @operation_plan = OperationPlan.new(operation_plan_params)
    if @operation_plan.save
      flash[:notice] = "保存しました"
      redirect_to impulse_purchase_path(@impulse_purchase)
    else
      flash[:alert] = "保存できません"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @impulse_purchase = current_user.impulse_purchases.find(params[:id])
    @operation_plan = current_user.operation_plan.find(params[:id])
  end

  def update
    respond_to do |format|
      if @operation_plan.update(operation_plan_params)
        format.html { redirect_to operation_plan_url(@operation_plan), notice: "Operation plan was successfully updated." }
        format.json { render :show, status: :ok, location: @operation_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation_plan.errors, status: :unprocessable_entity }
      end
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
