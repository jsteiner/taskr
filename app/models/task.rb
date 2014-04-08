class Task < ActiveRecord::Base
  belongs_to :list
  delegate :user, to: :list

  validates :name, presence: true

  def self.recent
    order(:created_at)
  end
end
