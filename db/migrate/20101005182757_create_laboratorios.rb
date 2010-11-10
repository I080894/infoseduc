class CreateLaboratorios < ActiveRecord::Migration
  def self.up
    create_table :laboratorios do |t|
      t.references :unidade, :null => false
      t.integer :num_comp
      t.string :config_comp
      t.string :servidor
      t.string :rede
      t.string :internet
      t.integer :num_imp
      t.string :config_imp
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :laboratorios
  end
end
