# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
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
class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :statement, :deadline, :description, :fee, :goal, :images
  attributes :amount_invested, :achieved_goal_percentage
  has_many :team_members
end
