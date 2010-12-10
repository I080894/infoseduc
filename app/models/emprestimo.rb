class Emprestimo < ActiveRecord::Base

  belongs_to :unidade
  belongs_to :departamento
end
