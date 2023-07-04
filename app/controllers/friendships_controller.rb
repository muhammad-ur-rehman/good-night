class FriendshipsController < ApplicationController
  attr_accessor :follower, :followed

  before_action :set_users, only: [:create, :destroy]

  def create
    if @follower.followed_users << @followed
      render json: @followed, status: :created
    else
      render json: { errors: @follower.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @follower.followed_users.delete(@followed)
      head :no_content
    else
      render json: { errors: @follower.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_users
    @follower = User.find(params[:user_id])
    @followed = User.find(params[:followed_id])
  end
end
