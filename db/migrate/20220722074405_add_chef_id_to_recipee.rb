class AddChefIdToRecipee < ActiveRecord::Migration[7.0]
  def change
    add_column :recipees, :chef_id, :integer
  end
end
