class TopicsController < ApplicationController
  # before_action :set_person, only: :create

  def index
    @topics =  Topic.all
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
    # unless @topic.user_id == current_user.id
    #   redirect_to root_path
    # end
  end

  def update
    @topic = Topic.update(topic_params)
    if
      @topic.update(topic_params)
      flash[:notice] = "記事が更新されました"
      redirect_to topic_path(@topic)
    else
      flash[:notice] = "記事の更新ができませんでした"
      render 'edit'
    end
  end

  def create
    @topic = Topic.create(topic_params)
    if
      @topic.save
      flash[:notice] = "記事が投稿されました"
      redirect_to topic_path(@topic)
    else
      render 'new'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    flash[:notice] = "記事が削除されました"
    redirect_to topics_path
  end

  def show
    @topic = Topic.find(params[:id])
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :description, :image).merge(person_id: current_person.id)
  end

  # def set_topic
  #   @topic = Topic.find(params[:person_id])
  # end

  # def set_person
  #   @person = Person.find(params[:person_id])
  # end

end