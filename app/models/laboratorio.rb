class Laboratorio < ActiveRecord::Base

  belongs_to :unidade


  def before_save
    self.servidor.upcase!
    self.rede.upcase!
    self.internet.upcase!
    self.config_comp.upcase!
    self.config_imp.upcase!
    self.obs.upcase!

  end

end
