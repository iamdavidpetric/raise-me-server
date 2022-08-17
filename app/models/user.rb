# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
	validates :first_name, :last_name, :email, :username, presence:true
	validates :email, uniqueness: { case_sensitive: false }

	has_many :projects

	def full_name
		"#{first_name} #{last_name}"
	end
end
