class CreateUnidades < ActiveRecord::Migration
  def self.up
    create_table :unidades do |t|
      t.references :tipo, :null => false
      t.string :nome
      t.string :endereco
      t.integer :num
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :fone
      t.string :email
      t.string :diretor
      t.string :coordenador
      t.string :obs

      t.timestamps
    end
  
  end

  def self.down
    drop_table :unidades
  end
end
