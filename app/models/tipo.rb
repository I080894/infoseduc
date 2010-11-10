class Tipo < ActiveRecord::Base

has_many :unidades

  def before_save
    self.nome.upcase!
end


end
