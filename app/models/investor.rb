# == Schema Information
#
# Table name: investors
#
#  id         :bigint           not null, primary key
#  ammount    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_investors_on_project_id  (project_id)
#  index_investors_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (user_id => users.id)
#
class Investor < ApplicationRecord
  validates :user_id, :project_id, :goal, presence:true

  belongs_to :user, dependent: :destroy
  belongs_to :project, dependent: :destroy
end
