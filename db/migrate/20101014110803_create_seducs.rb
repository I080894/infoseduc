class CreateSeducs < ActiveRecord::Migration
  def self.up
    create_table :seducs do |t|
      t.references :departamento, :null => false
      t.string :servidor
      t.string :internet
      t.integer :num_comp
      t.string :computador
      t.integer :num_imp
      t.string :impressora
      t.string :rede
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :seducs
  end
end
