class SleepRecordService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def followed_users_records
    friends = user.followed_users
    SleepRecord.joins(:user)
               .where(user: { id: friends })
               .where('clock_in >= ?', 1.week.ago.beginning_of_day)
               .order(created_at: :desc)
  end
end
