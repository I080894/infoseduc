class CreateAdministracaos < ActiveRecord::Migration
  def self.up
    create_table :administracaos do |t|
      t.references :unidade, :null => false
      t.integer :num_comp_seduc, :default => 0
      t.string :config_comp_seduc
      t.integer :num_imp_seduc, :default => 0
      t.string :config_imp_seduc
      t.string :servidor
      t.string :rede
      t.string :internet
      t.integer :num_comp, :default => 0
      t.string :config_comp
      t.string :pertence_comp
      t.string :contato_comp
      t.integer :num_imp, :default => 0
      t.string :config_imp
      t.string :pertence_imp
      t.string :contato_imp
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :administracaos
  end
end
