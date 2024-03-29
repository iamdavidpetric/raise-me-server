# == Schema Information
#
# Table name: projects
#
#  id              :bigint           not null, primary key
#  category        :string
#  deadline        :date
#  description     :string
#  fee             :integer
#  goal            :integer
#  images          :text             default([]), is an Array
#  name            :string
#  statement       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  stripe_price_id :string
#  user_id         :bigint           not null
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
  validates :goal, :deadline, :name, :description, presence: true

  after_create :create_stripe_product

  belongs_to :user
  has_many :investors, dependent: :delete_all
  has_many :team_members, dependent: :delete_all

  accepts_nested_attributes_for :team_members

  scope :by_category, ->(category) { category == '' ? all : where(category: category) }
  scope :by_search, ->(search) { where('name ILIKE ? OR description ILIKE ?', "%#{search}%", "%#{search}%") }

  def amount_invested
    investors.sum(:ammount)
  end

  def achieved_goal_percentage
    amount_invested.to_f / goal.to_f * 100
  end

  def yesterdays_investors_number
    investors.where(created_at: Date.yesterday.all_day).count
  end

  def create_stripe_product
    product = Stripe::Product.create({ name: name })

    price = Stripe::Price.create({
                                   unit_amount: fee * 100,
                                   currency: 'usd',
                                   product: product.id
                                 })
    update(stripe_price_id: price.id)
  end
end
