class GuestSessionsController < ApplicationController
  skip_before_action :authenticate_person!

  def create
    person = Person.find_or_create_by(email: 'guest@example.com') do |person|
      person.password = SecureRandom.urlsafe_base64
      person.save unless person.id
      person.name = "ゲストユーザー"
    end
    sign_in person
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
