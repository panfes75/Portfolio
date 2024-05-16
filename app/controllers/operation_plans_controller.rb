class OperationPlansController < ApplicationController
  before_action :set_operation_plan, only: %i[ show edit update destroy ]

  # GET /operation_plans or /operation_plans.json
  def index
    @operation_plans = OperationPlan.all
  end

  # GET /operation_plans/1 or /operation_plans/1.json
  def show
  end

  # GET /operation_plans/new
  def new
    @operation_plan = OperationPlan.new
  end

  # GET /operation_plans/1/edit
  def edit
  end

  # POST /operation_plans or /operation_plans.json
  def create
    @operation_plan = OperationPlan.new(operation_plan_params)

    respond_to do |format|
      if @operation_plan.save
        format.html { redirect_to operation_plan_url(@operation_plan), notice: "Operation plan was successfully created." }
        format.json { render :show, status: :created, location: @operation_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operation_plans/1 or /operation_plans/1.json
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

  # DELETE /operation_plans/1 or /operation_plans/1.json
  def destroy
    @operation_plan.destroy!

    respond_to do |format|
      format.html { redirect_to operation_plans_url, notice: "Operation plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation_plan
      @operation_plan = OperationPlan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def operation_plan_params
      params.require(:operation_plan).permit(:start_on, :completion_on, :remind, :task, :impulse_purchase_id)
    end
end
