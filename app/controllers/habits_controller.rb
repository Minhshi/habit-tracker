class HabitsController < ApplicationController

  def index
    @habits = Habit.all
  end

  def show
    @habit = Habit.find(params[:id])
  end

  def new
    @habit = Habit.new
    authorize @habit
  end

  def create
    @habit = Habit.new(habit_params)
    @habit.user = current_user
    if @habit.save
      redirect_to habits_path
    else
      render :new
    end
  end

  def edit
    @habit = Habit.find(params[:id])
  end

  def update
    @habit = Habit.find(params[:id])
    @habit.update(habit_params)
    if @habit.save
      redirect_to habits_path
    else
      render :edit
    end
  end

  def destroy
    @habit = Habit.find(params[:id])
    @habit.delete
    redirect_to habits_path
  end

 private

  def find_habit
    @habit = Habit.find(params[:id])
  end

  def habit_params
    params.require(:habit).permit(:title, :details, :category)
  end
end
