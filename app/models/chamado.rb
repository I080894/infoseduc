class Chamado < ActiveRecord::Base
  belongs_to :estagiario
  belongs_to :tipos_problema
  belongs_to :situacao_chamado
  belongs_to :unidade
end
