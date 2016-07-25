class RemoveCustomDrugFromMedication < ActiveRecord::Migration
  def change
    remove_column :medications, :custom_drug, :string
  end
end
