class BuysController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @deli_info = DeliveryInformation.all
  end
end
