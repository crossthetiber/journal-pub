class RenameRedactorAssets < ActiveRecord::Migration
  def self.up
    rename_table :redactor_assets, :redactor2_assets
  end

  def self.down
    rename_table :redactor2_assets, :redactor_assets
  end
end
