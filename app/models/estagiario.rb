class Estagiario < ActiveRecord::Base

  belongs_to :unidade
  has_many :users
  has_many :saidas
  has_many :relatorios
  has_many :chamados

  after_create :etinerancia


protected

def etinerancia
      
      @etinerante = Estagiario.find(self.id)
      $etine = self.unidade_id
    
     if (($etine == 54) or ($etine == 55) or ($etine == 56) or ($etine == 57) or ($etine== 58))

        @etinerante.etinerante = 1
        @etinerante.save
     end
  end

def desliga

     if desligado == false then
      return "NÃO"
    else
      return "SIM"
    end
  end




def before_save
    self.nome.upcase!
    self.endereco.upcase!
    self.complemento.upcase!
    self.bairro.upcase!
    self.cidade.upcase!
    self.email.upcase!
    self.faculdade.upcase!
    self.responsavel.upcase!
    self.periodo_trab.upcase!
    self.periodo_est.upcase!
    
    self.obs.upcase!

end

end

      