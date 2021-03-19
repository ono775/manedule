class MembersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_members, only: [:show]

  def index
    @members = Member.all.order(:name_id)
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to members_path
    else
      render :new
    end
  end

  def show
    @schedules = Schedule.all
  end

  private

  def member_params
    params.require(:member).permit(:name_id, :position_id)
  end

  def set_members
    @member = Member.find(params[:id])
  end
end
