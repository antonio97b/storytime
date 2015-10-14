class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.column :username, :string
      t.column :sentence, :string
      t.column :order_id, :integer
      t.column :image, :string

      t.timestamps
    end
  end
end
