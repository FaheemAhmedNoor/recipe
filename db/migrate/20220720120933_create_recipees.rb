class CreateRecipees < ActiveRecord::Migration[7.0]
  def change
    create_table :recipees do |t|
      t.string :name
      t.string :summary
      t.string :description

      t.timestamps
    end
  end
end
