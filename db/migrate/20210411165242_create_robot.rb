class CreateRobot < ActiveRecord::Migration[5.2]
  def change
    create_table :robots do |t|
    	t.string :direction
    	t.integer :x_coordinate, default: 0
    	t.integer :y_coordinate, default: 0
    	t.timestamps
    end
  end
end
