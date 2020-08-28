class TopicsController < ApplicationController
  # before_action :set_topic, only [:create, :show]

  def index
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to @topic
    else
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :description, :image)
  end

  # def set_topic
  #   @topic = Topic.find(params[:id])
  # end

end