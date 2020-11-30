class TopicsController < ApplicationController
  before_action :set_topic, only: %i[edit update destroy]

  def index
    @tag_list = Tag.all
    @topics = Topic.all
    @topic = current_person.topics.new
  end

  def new
    @topic = Topic.new
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end

  def create
    # @person = Person.find(current_person.id)
    # @icon = @person.icon
    @topic = Topic.new(topic_params)
    # tag_list = params[:topic][:tag_name].split(nil)
    if @topic.save
      # @topic.save_tag(tag_list)
      flash[:notice] = "記事が投稿されました"
      redirect_to topic_path(@topic)
    else
      render 'new'
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    @person = Person.find(current_person.id)
    @icon = @person.icon
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

  def search
    @topics = Topic.search(params[:keyword])
    @person = Person.find(current_person.id)
    @icon = @person.icon
    # @topics =  Topic.all
  end

  def destroy
    # @topic = Topic.find(params[:id])
    @topic.destroy
    flash[:notice] = "記事が削除されました"
    redirect_to person_path(current_person.id)
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    @person = Person.find_by(id: @topic.person_id)
    @like_count = Like.where(topic_id: @topic.id).count
    @person = Person.find(current_person.id)
    @icon = @person.icon
    @topic = Topic.find(params[:id])
    @topic_tags = @topic.tags
  end

  def index_1
    @tag_list = Tag.all
    @topics = Topic.all
  end

  def list_1
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end

  def list_2
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end

  def list_3
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end

  def list_4
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end

  def list_5
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end

  def list_6
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end

  def list_7
    @person = Person.find(current_person.id)
    @icon = @person.icon
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :heading, :description, :image, tag_name: []).merge(person_id: current_person.id)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  # def set_person
  #   @person = Person.find(params[:person_id])
  # end
end
