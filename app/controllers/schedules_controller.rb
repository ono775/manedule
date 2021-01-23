class SchedulesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_schedule, only: [:show, :edit, :update]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedule_path
    else
      render :edit
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_date, :end_date, :client, :title, :content).merge(user_id: current_user.id)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
