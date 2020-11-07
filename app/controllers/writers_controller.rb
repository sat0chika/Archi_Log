class WritersController < ApplicationController
  def show
    @topic = Topic.find_by(id: params[:id])
    @person = Person.find_by(id: @topic.person_id)

    @person = Person.find(current_person.id)
    @icon = @person.icon
  end

  def show_1
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end

  def show_2
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end

  def show_3
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end

  def show_4
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end

  def show_5
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end

  def show_6
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end
end
