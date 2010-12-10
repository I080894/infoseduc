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
      if (params[:search].nil? || params[:search].empty?)
      @chamados = Chamado.paginate :page => params[:page], :order => 'data_sol DESC', :per_page => 16
      $var = 0
    else
      @chamados = Chamado.find(:all, :joins => :unidade, :conditions => ["unidades.nome like ?", "%" + params[:search].to_s + "%"], :order => 'nome ASC')
      $var = 1
    end




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
        format.html { redirect_to(homes_path) }
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

  def ordemservico
    @chamados = Chamado.find(params[:id])
  end

def encerrados
    @chamados = Chamado.find(:all, :conditions => ['situacao_chamado_id =?',2])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chamados }
    end
  end

 def showencerrado
     @chamados = Chamado.find(params[:id])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @chamados }
    end
  end

end
