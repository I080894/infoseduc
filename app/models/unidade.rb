class Unidade < ActiveRecord::Base

belongs_to :tipo
has_many :estagiarios
has_many :senhas
has_many :laboratorios
has_many :administracaos
has_many :saidas
has_many :relatorios
has_many :chamados



  def before_save
    self.nome.upcase!
    self.endereco.upcase!
    self.complemento.upcase!
    self.bairro.upcase!
    self.diretor.upcase!
    self.coordenador.upcase!
    self.obs.upcase!

  end


  


  end
