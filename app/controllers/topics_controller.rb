class TopicsController < ApplicationController
  # before_action :set_group

  def index
  end

  def new
    @topic = Topic.new
  end


end