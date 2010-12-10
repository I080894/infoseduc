class Chamado < ActiveRecord::Base
  belongs_to :estagiario
  belongs_to :tipos_problema
  belongs_to :situacao_chamado
  belongs_to :unidade


  def before_save
    self.solicitante.upcase!
    self.depto.upcase!
    self.problema.upcase!
    self.obs.upcase!
    
end

end
