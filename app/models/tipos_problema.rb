class TiposProblema < ActiveRecord::Base

  has_many :chamados


  def before_save
    self.tipo.upcase!
  end

end
