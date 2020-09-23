class PeopleController < ApplicationController

  def show
    @person = Person.find(current_person.id)
    person = Person.find(current_person.id)
    @name = person.name
    @introduction = person.introduction
    @icon = person.icon
    @topics = person.topics.order("created_at DESC").limit(10)
  end

  def fab
    @person = Person.find(current_person.id)
    @icon = @person.icon
    person = Person.find(current_person.id)
    @name = person.name
    @introduction = person.introduction
    @topics = Topic.all
    @like = Like.where(person_id: current_person.id)
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
    params.require(:person).permit(:name, :email, :introduction, :icon, :password, :password_confirmation, :introduce, :image)
  end

end
