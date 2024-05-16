require "test_helper"

class OperationPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operation_plan = operation_plans(:one)
  end

  test "should get index" do
    get operation_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_operation_plan_url
    assert_response :success
  end

  test "should create operation_plan" do
    assert_difference("OperationPlan.count") do
      post operation_plans_url, params: { operation_plan: { completion_on: @operation_plan.completion_on, impulse_purchase_id: @operation_plan.impulse_purchase_id, remind: @operation_plan.remind, start_on: @operation_plan.start_on, task: @operation_plan.task } }
    end

    assert_redirected_to operation_plan_url(OperationPlan.last)
  end

  test "should show operation_plan" do
    get operation_plan_url(@operation_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_operation_plan_url(@operation_plan)
    assert_response :success
  end

  test "should update operation_plan" do
    patch operation_plan_url(@operation_plan), params: { operation_plan: { completion_on: @operation_plan.completion_on, impulse_purchase_id: @operation_plan.impulse_purchase_id, remind: @operation_plan.remind, start_on: @operation_plan.start_on, task: @operation_plan.task } }
    assert_redirected_to operation_plan_url(@operation_plan)
  end

  test "should destroy operation_plan" do
    assert_difference("OperationPlan.count", -1) do
      delete operation_plan_url(@operation_plan)
    end

    assert_redirected_to operation_plans_url
  end
end
