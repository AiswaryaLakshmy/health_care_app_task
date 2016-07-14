class AddCustomDrugToDefaultDrugList < ActiveRecord::Migration
  def change
    add_column :default_drug_lists, :custom_drug, :string
  end
end
