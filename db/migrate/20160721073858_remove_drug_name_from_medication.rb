class RemoveDrugNameFromMedication < ActiveRecord::Migration

  def change
    remove_column :medications, :drug_name, :string
  end
  
end
