# == Schema Information
#
# Table name: projects
#
#  id           :bigint           not null, primary key
#  deadline     :date
#  description  :string
#  goal         :integer
#  images       :text             default([]), is an Array
#  name         :string
#  team_members :text             default([]), is an Array
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
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
  belongs_to :user
end
