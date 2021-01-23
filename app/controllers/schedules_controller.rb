class SchedulesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

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
    @schedule = Schedule.find(params[:id])
  end

  def edit
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_date, :end_date, :client, :title, :content).merge(user_id: current_user.id)
  end
end
