class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
    	t.belongs_to :user, index: true
      t.belongs_to :drug, index: true
    	t.string :dosage
    	t.string :timing
      t.timestamps null: false
    end
  end
end
