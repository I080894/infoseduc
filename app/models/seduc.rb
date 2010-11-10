class Seduc < ActiveRecord::Base

belongs_to :departamento


  def before_save

    self.servidor.upcase!
    self.rede.upcase!
    self.internet.upcase!
    self.computador.upcase!
    self.impressora.upcase!
    self.obs.upcase!

  end

       

  
end
