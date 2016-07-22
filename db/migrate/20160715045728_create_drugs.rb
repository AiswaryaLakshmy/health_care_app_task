class CreateDrugs < ActiveRecord::Migration

  def change
    create_table :drugs do |t|
    	t.string :drug_name
      t.timestamps null: false
    end
  end
  
end
