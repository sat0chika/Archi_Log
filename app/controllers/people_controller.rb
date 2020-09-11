class PeopleController < ApplicationController

  def show
    person = Person.find(current_person.id)
    @name = person.name
    @topics = person.topics.order("created_at DESC").limit(5)
  end

  def fab
    person = Person.find(current_person.id)
    @name = person.name
    @topics = person.topics.order("created_at DESC").limit(5)
  end

  def edit
    # @person = Person.find(params[:id])
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
    params.require(:person).permit(:name, :email, :password, :password_confirmation, :introduce, :image)
  end

end
