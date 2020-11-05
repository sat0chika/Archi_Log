class MainController < ApplicationController

  def index
    @topics = Topic.includes(:person).order("created_at DESC").limit(10)
    # Date.current.strftime('%Y/%m/%d')
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end

  def edit
    # @person = Person.find(params[:id])
  end

  def new_guest
    person = Person.find_or_create_by(email: 'guest@example.com') do |person|
      binding.pry
      person.password = SecureRandom.urlsafe_base64
      person.save if !person.id
      person.name = "ゲストユーザー"
    end
    sign_in person
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
