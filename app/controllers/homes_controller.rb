class HomesController < ApplicationController

before_filter :login_required

  def index
  end

  def sobresis
    render :update do |page|
        page.replace_html 'tela_sobre', :text => ''
        page.replace_html 'tela_sobre', :partial => 'sobre'
    end
  end

protected


  def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end



end
