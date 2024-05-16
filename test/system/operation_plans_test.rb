require "application_system_test_case"

class OperationPlansTest < ApplicationSystemTestCase
  setup do
    @operation_plan = operation_plans(:one)
  end

  test "visiting the index" do
    visit operation_plans_url
    assert_selector "h1", text: "Operation plans"
  end

  test "should create operation plan" do
    visit operation_plans_url
    click_on "New operation plan"

    fill_in "Completion on", with: @operation_plan.completion_on
    fill_in "Impulse purchase", with: @operation_plan.impulse_purchase_id
    check "Remind" if @operation_plan.remind
    fill_in "Start on", with: @operation_plan.start_on
    fill_in "Task", with: @operation_plan.task
    click_on "Create Operation plan"

    assert_text "Operation plan was successfully created"
    click_on "Back"
  end

  test "should update Operation plan" do
    visit operation_plan_url(@operation_plan)
    click_on "Edit this operation plan", match: :first

    fill_in "Completion on", with: @operation_plan.completion_on
    fill_in "Impulse purchase", with: @operation_plan.impulse_purchase_id
    check "Remind" if @operation_plan.remind
    fill_in "Start on", with: @operation_plan.start_on
    fill_in "Task", with: @operation_plan.task
    click_on "Update Operation plan"

    assert_text "Operation plan was successfully updated"
    click_on "Back"
  end

  test "should destroy Operation plan" do
    visit operation_plan_url(@operation_plan)
    click_on "Destroy this operation plan", match: :first

    assert_text "Operation plan was successfully destroyed"
  end
end
