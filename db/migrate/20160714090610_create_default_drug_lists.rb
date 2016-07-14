class CreateDefaultDrugLists < ActiveRecord::Migration
  def change
    create_table :default_drug_lists do |t|
    	t.string :drug_name
    	t.string :dosage
    	t.string :timing
      t.timestamps null: false
    end
  end
end
