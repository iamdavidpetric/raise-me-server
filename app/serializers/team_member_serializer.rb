# == Schema Information
#
# Table name: team_members
#
#  id         :bigint           not null, primary key
#  avatar_url :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_team_members_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
class TeamMemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar_url
end
