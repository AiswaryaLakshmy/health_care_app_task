class AddCustomDrugToMedication < ActiveRecord::Migration
  def change
    add_column :medications, :custom_drug, :string
  end
end
