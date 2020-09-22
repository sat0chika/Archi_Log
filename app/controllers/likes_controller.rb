class LikesController < ApplicationController
  before_action :set_topic

  def create
    @like = current_person.likes.build(topic_id: params[:topic_id])
    @like.save
    @topic = Topic.find_by(id: @like.topic_id)
    @like_count = Like.where(topic_id: params[:topic_id]).count
    if @like.save
      redirect_to topic_path(params[:topic_id])
    end
  end

  def destroy
    @like = Like.find_by(topic_id: params[:topic_id], person_id: current_person.id)
    @like_count = Like.where(topic_id: params[:topic_id]).count
    if @like.destroy
      redirect_to topic_path(params[:topic_id])
    end
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
end