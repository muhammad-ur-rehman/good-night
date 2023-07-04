class SleepRecordsController < ApplicationController
  attr_accessor :user

  before_action :set_users

  def index
    sleep_records = user.sleep_records.order(created_at: :asc)
    render json: sleep_records
  end

  def clock_in
    sleep_record = user.sleep_records.build(clock_in: Time.current)

    if sleep_record.save
      render json: sleep_record, status: :created
    else
      render json: { errors: sleep_record.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def clock_out
    sleep_record = user.sleep_records.where(clock_out: nil).last

    if sleep_record.present?
      sleep_record.update(clock_out: Time.current)
      render json: sleep_record
    else
      render json: { error: 'No active sleep record found' }, status: :not_found
    end
  end

  private

  def set_users
    @user = User.find(params[:user_id])
  end
end
