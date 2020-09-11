class MainController < ApplicationController

  def index
    @topics = Topic.includes(:person).order("created_at DESC").limit(5)
    # Date.current.strftime('%Y/%m/%d')
  end

  # def
  #   Date.current.strftime('%Y/%m/%d')
  # end

  # def edit
  #   @group = Group.find(params[:id])
  # end

  def edit
    # @person = Person.find(params[:id])
  end

end
