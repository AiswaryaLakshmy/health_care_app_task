class AddCustomDrugToDrug < ActiveRecord::Migration
  def change
    add_column :drugs, :custom_drug, :boolean, default: false
  end
end
