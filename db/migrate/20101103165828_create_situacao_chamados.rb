class CreateSituacaoChamados < ActiveRecord::Migration
  def self.up
    create_table :situacao_chamados do |t|
      t.string :situacao

      t.timestamps
    end
  end

  def self.down
    drop_table :situacao_chamados
  end
end
