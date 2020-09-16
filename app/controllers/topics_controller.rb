class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]

  def index
    @topics =  Topic.all
  end

  def new
    @topic = Topic.new
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

  def edit
    @topic = Topic.find(params[:id])
    # unless @topic.user_id == current_user.id
    #   redirect_to root_path
    # end
  end

  def update
    # @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      flash[:notice] = "記事が更新されました"
      redirect_to topic_path(@topic)
    else
      flash[:notice] = "記事の更新ができませんでした"
      render 'edit'
    end
  end


  def destroy
    # @topic = Topic.find(params[:id])
    @topic.destroy
    flash[:notice] = "記事が削除されました"
    redirect_to person_path(current_person.id)
  end

  def show
    @topic = Topic.find(params[:id])
    @like_count = Like.where(topic_id: @topic.id).count
  end

  def list_1
  end

  def list_2
  end

  def list_3
  end

  def list_4
  end

  def list_5
  end

  def list_6
  end

  def list_7
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :description, :image).merge(person_id: current_person.id)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  # def set_person
  #   @person = Person.find(params[:person_id])
  # end

end