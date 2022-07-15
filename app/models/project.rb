# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  category    :string
#  deadline    :date
#  description :string
#  fee         :integer
#  goal        :integer
#  images      :text             default([]), is an Array
#  name        :string
#  statement   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_projects_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Project < ApplicationRecord
  validates :goal, :deadline, :name, :description, presence:true


  has_many :investors, dependent: :delete_all
  has_many :team_members, dependent: :delete_all
  belongs_to :user

  scope :by_category, -> (category) { category=="" ? all : where(category: category) }
  scope :by_search, -> (search) {search=="" ? all : where('name ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%")}


  def amount_invested
    investors.sum(:ammount)
  end

  def achieved_goal_percentage
    amount_invested.to_f / goal.to_f * 100
  end

  def yesterdays_investors_number
    investors.where(created_at: Date.yesterday.all_day).count
  end
end
