class LikesController < ApplicationController
  before_action :set_topic

  def create
    like = current_person.likes.build(topic_id: params[:topic_id])
    like.save
    @topic = Topic.find_by(id: @like.topic_id)
    @like_count = Like.where(topic_id: params[:topic_id]).count
    # render 'create.js.erb'
  end

  def destroy
    like = Like.find_by(topic_id: params[:topic_id], person_id: current_person.id)
    like.destroy
    @like_count = Like.where(topic_id: params[:topic_id]).count
    # render 'destroy.js.erb'
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
end
