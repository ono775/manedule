class MembersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
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

  private

  def member_params
    params.require(:member).permit(:name_id, :position_id)
  end
end
