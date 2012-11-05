class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
    	t.integer  :rank
      t.timestamps
    end
  end
end
