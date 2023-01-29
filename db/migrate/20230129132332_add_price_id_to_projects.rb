class AddPriceIdToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :stripe_price_id, :string
  end
end
