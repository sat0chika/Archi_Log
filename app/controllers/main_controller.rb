class MainController < ApplicationController

  def index
    @topics = Topic.includes(:person).order("created_at DESC").limit(5)
  end

  # def edit
  #   @group = Group.find(params[:id])
  # end

end
