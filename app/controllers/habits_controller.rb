class HabitsController < ApplicationController
  before_action :find_habit, only: [:show, :edit, :update, :destroy]

  def index
    @habits = policy_scope(Habit)
  end

  def show
  end

  def new
    @habit = Habit.new
    authorize @habit
  end

  def create
    @habit = Habit.new(habit_params)
    @habit.user = current_user
    authorize @habit
    if @habit.save
      redirect_to habit_path(@habit)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @habit.update(habit_params)
    if @habit.save
      redirect_to habits_path
    else
      render :edit
    end
  end

  def destroy
    @habit.delete
    redirect_to habits_path
  end

  private

  def find_habit
    @habit = Habit.find(params[:id])
    authorize @habit
  end

  def habit_params
    params.require(:habit).permit(:title, :details, :category)
  end
end
