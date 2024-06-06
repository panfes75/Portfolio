class PrefectureMinimumWagesController < ApplicationController
  before_action :set_prefecture_minimum_wage, only: %i[edit update destroy]
  def index
    @prefecture_minimum_wages = PrefectureMinimumWage.all.order(id: :asc)
  end

  def new
    @prefecture_minimum_wage = PrefectureMinimumWage.new
  end

  def create
    @prefecture_minimum_wage = PrefectureMinimumWage.new(prefecture_minimum_wage_params)
    if @prefecture_minimum_wage.save
      flash[:notice] = '保存しました'
      redirect_to prefecture_minimum_wages_path
    else
      flash[:alert] = '保存できません'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @prefecture_minimum_wage.update(prefecture_minimum_wage_params)
      flash[:notice] = '更新しました'
      redirect_to prefecture_minimum_wages_path
    else
      flash[:alert] = '更新できません'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @prefecture_minimum_wage.destroy!
    flash[:notice] = '削除しました'
    redirect_to prefecture_minimum_wages_path
  end

  private

  def set_prefecture_minimum_wage
    @prefecture_minimum_wage = PrefectureMinimumWage.find(params[:id])
  end

  def prefecture_minimum_wage_params
    params.require(:prefecture_minimum_wage).permit(:name, :amount)
  end
end
