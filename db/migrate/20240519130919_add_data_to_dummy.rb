class AddDataToDummy < ActiveRecord::Migration[7.1]
  def change
    add_column :dummies, :data, :string
  end
end
