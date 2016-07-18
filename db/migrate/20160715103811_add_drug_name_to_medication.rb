class AddDrugNameToMedication < ActiveRecord::Migration
  def change
    add_column :medications, :drug_name, :string
  end
end
