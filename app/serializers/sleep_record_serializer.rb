class SleepRecordSerializer < ActiveModel::Serializer
  attributes :id, :clock_in, :clock_out, :created_at

  belongs_to :user
end
