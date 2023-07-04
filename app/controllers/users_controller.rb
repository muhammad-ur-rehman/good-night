class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end


  def following_sleep_records
    user = User.find(params[:user_id])

    sleep_records = SleepRecordService.new(user).followed_users_records

    render json: sleep_records, include: { user: { only: :name } }
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
