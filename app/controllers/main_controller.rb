class MainController < ApplicationController

  def index
    @topics = Topic.includes(:person).order("created_at DESC").limit(10)
    # Date.current.strftime('%Y/%m/%d')
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end


  # def edit
  #   @group = Group.find(params[:id])
  # end

  def edit
    # @person = Person.find(params[:id])
  end

end
