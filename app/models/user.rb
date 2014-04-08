class User < ActiveRecord::Base
  include Clearance::User

  has_many :lists, dependent: :destroy
  has_many :tasks, through: :lists

  def owns?(object)
    object.user == self
  end

  def most_recent_task
    tasks.recent.last
  end
end
