class ImpressorasController < ApplicationController
  layout "application"

  before_filter :load_administracaos

  before_filter :load_laboratorios

  before_filter :load_seducs


   def load_seducs
    @seducs = Seduc.find(:all)
  end

   def load_laboratorios
    @laboratorios = Laboratorio.find(:all)
  end


   def load_administracaos
    @administracaos = Administracao.find(:all)

  end

def index
    @laboratorios = Laboratorio.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 6
    @administracaos = Administracao.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 6
    @seducs = Seduc.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 6
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @laboratorios }
      format.xml  { render :xml => @administracaos }
    end
  end

end
