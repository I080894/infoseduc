class Estagiario < ActiveRecord::Base

  belongs_to :unidade
  belongs_to :regiao
  has_many :users
  has_many :saidas
  has_many :relatorios
  has_many :chamados
  before_save :etinerancia
  before_update :sem_est, :if => :verify?
  before_save :com_est, :if => :verify?
  before_update :sai, :if => :verify?

  def verify?
    self.unidade_id.present?
  end

protected

def etinerancia
     
     if (self.periodo_trab == 'ITINERANTE' ) then
        self.etinerante = 1
        self.unidade_id = nil
     else
        self.etinerante = 0
        


     end
  end

def desliga
   if desligado == false then
    return "NÃO"
   else
      return "SIM"
   end
  
  end
  def sai
   if desligado == 1 then
     @unidade=Unidade.find(self.unidade_id)
     if (self.periodo_trab == 'MATUTINO') then
         @unidade.estagiarioM = 0
     end
     if (self.periodo_trab == 'VESPERTINO') then
      @unidade.estagiarioV = 0
     end
     @unidade.save
   else
     @unidade=Unidade.find(self.unidade_id)
     if (self.periodo_est == 'MATUTINO') then
         @unidade.estagiarioM = 1
     end
     if (self.periodo_est == 'VESPERTINO') then
       @unidade.estagiarioV = 1
     end
     @unidade.save
   end

  end

def sem_est

 $teste= self.periodo_trab
 if ($teste == 'MATUTINO')then
  @unidade=Unidade.find(self.unidade_id)
   if self.desligado == 1 then
      @unidade.estagiarioM = 0
    else
      @unidade.estagiarioM = 1
    end
    @unidade.save
 end
 if ($teste == 'VESPERTINO')then
  @unidade=Unidade.find(self.unidade_id)
   if self.desligado == 1 then
      @unidade.estagiarioV = 0
    else
      @unidade.estagiarioV = 1
    end
    @unidade.save
  end
 if ($teste == 'ITINERANTE')then
  @unidade=Unidade.find(self.unidade_id)
   if self.desligado == 1 then
      @unidade.estagiarioE = 0
    else
      @unidade.estagiarioE = 1
    end
    @unidade.save
  end
end

def com_est

 $teste= self.periodo_trab
 if ($teste == 'MATUTINO')then
  @unidade=Unidade.find(self.unidade_id)
  @unidade.estagiarioM = 1
  @unidade.save
 end
 if ($teste == 'VESPERTINO')then
  @unidade=Unidade.find(self.unidade_id)
  @unidade.estagiarioV = 1
  @unidade.save
  end
end

 def before_save
    self.nome.upcase!
    self.endereco.upcase!
    self.complemento.upcase!
    self.bairro.upcase!
    self.cidade.upcase!
    self.faculdade.upcase!
    self.responsavel.upcase!
    self.aval.upcase!
    self.obs.upcase!
end


end

      