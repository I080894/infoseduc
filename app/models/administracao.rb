class Administracao < ActiveRecord::Base

  belongs_to :unidade


  def before_save
    self.config_comp_seduc.upcase!
    self.config_imp_seduc.upcase!
    self.servidor.upcase!
    self.rede.upcase!
    self.internet.upcase!
    self.config_comp.upcase!
    self.pertence_comp.upcase!
    self.contato_comp.upcase!
    self.config_imp.upcase!
    self.pertence_imp.upcase!
    self.contato_imp.upcase!
    self.obs.upcase!

  end



end
