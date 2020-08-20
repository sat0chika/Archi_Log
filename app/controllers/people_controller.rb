class PeopleController < ApplicationController

  def show
    # People = People.find(params[:id])
    # @name = people.name
    # @topics = people.topics
  end

  def edit
  end

  def update
    if current_person.update(person_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def person_params
    params.require(:user).permit(:name, :email)
  end
end
