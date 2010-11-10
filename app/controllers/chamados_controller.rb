class ChamadosController < ApplicationController
  # GET /chamados
  # GET /chamados.xml


  before_filter :load_unidades
  before_filter :load_estagiarios
  before_filter :load_situacaos
  before_filter :load_tipos

def load_tipos
    @tipos = TiposProblema.find(:all)
  end

 def load_situacaos
    @situacaos = SituacaoChamado.find(:all)
  end

def load_estagiarios
    @estagiarios = Estagiario.find(:all, :order => 'nome ASC',:conditions => ['desligado=?',0])
  end

   def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end
  def index
    @chamados = Chamado.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chamados }
    end
  end

  # GET /chamados/1
  # GET /chamados/1.xml
  def show
    @chamados = Chamado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chamados }
    end
  end

  # GET /chamados/new
  # GET /chamados/new.xml
  def new
    @chamados = Chamado.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chamados }
    end
  end

  # GET /chamados/1/edit
  def edit
    @chamados = Chamado.find(params[:id])
  end

  # POST /chamados
  # POST /chamados.xml
  def create
    @chamados = Chamado.new(params[:chamado])

    respond_to do |format|
      if @chamados.save
        flash[:notice] = 'SOLICITAÇÃO DE SERVIÇO CADASTRADA COM SUCESSO.'
        format.html { redirect_to(@chamados) }
        format.xml  { render :xml => @chamados, :status => :created, :location => @chamados }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chamados.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chamados/1
  # PUT /chamados/1.xml
  def update
    @chamados = Chamado.find(params[:id])

    respond_to do |format|
      if @chamados.update_attributes(params[:chamado])
        flash[:notice] = 'SOLICITAÇÃO DE SERVIÇO SALVA COM SUCESSO.'
        format.html { redirect_to(@chamados) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chamados.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chamados/1
  # DELETE /chamados/1.xml
  def destroy
    @chamados = Chamado.find(params[:id])
    @chamados.destroy

    respond_to do |format|
      format.html { redirect_to(chamados_url) }
      format.xml  { head :ok }
    end
  end

  


end
