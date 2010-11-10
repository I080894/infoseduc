class CreateTiposProblemas < ActiveRecord::Migration
  def self.up
    create_table :tipos_problemas do |t|
      t.string :tipo

      t.timestamps
    end
  end

  def self.down
    drop_table :tipos_problemas
  end
end
