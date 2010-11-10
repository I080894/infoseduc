class UnidadesController < ApplicationController
  # GET /unidades
  # GET /unidades.xml

   before_filter :load_unidades
   before_filter :load_estagiarios
   before_filter :load_tipos
   before_filter :load_sem_estagiarios

def load_sem_estagiarios
    @sem_estagiario =Unidade.find(:all, :order => 'nome ASC')
  end

def load_tipos
    @tipos =Tipo.find(:all, :order => 'nome ASC')
  end

def load_estagiarios
    @estagiarios = Estagiario.find(:all, :order => 'nome ASC')
  end

   def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end
  
  def index
    if (params[:search].nil? || params[:search].empty?)
      #@unidades = Unidade.find(:all, :order => 'nome ASC')
      @unidades = Unidade.paginate :page => params[:page], :order => 'nome ASC', :per_page => 15
      $var = 0
    else
      @unidades = Unidade.find(:all, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"], :order => 'nome ASC')
      $var = 1
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @unidades }
    end
  end

  # GET /unidades/1
  # GET /unidades/1.xml
  def show
    @unidades = Unidade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @unidades }
    end
  end

  # GET /unidades/new
  # GET /unidades/new.xml
  def new
    @unidades = Unidade.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @unidades }
    end
  end

  # GET /unidades/1/edit
  def edit
    @unidades = Unidade.find(params[:id])
  end

  # POST /unidades
  # POST /unidades.xml
  def create
    @unidades = Unidade.new(params[:unidade])
    respond_to do |format|
      if @unidades.save
        flash[:notice] = 'UNIDADE CADASTRADA COM SUCESSO.'
        format.html { redirect_to(@unidades) }
        format.xml  { render :xml => @unidades, :status => :created, :location => @unidades }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @unidades.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /unidades/1
  # PUT /unidades/1.xml
  def update
    @unidades = Unidade.find(params[:id])

    respond_to do |format|
      if @unidades.update_attributes(params[:unidade])
        flash[:notice] = 'UNIDADES SALVA COM SUCESSO.'
        format.html { redirect_to(@unidades) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unidades.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /unidades/1
  # DELETE /unidades/1.xml
  def destroy
    @unidades = Unidade.find(params[:id])

    $uni_id = params[:id]
    @estagiario = Estagiario.find(:all, :conditions => ['unidade_id = ' + $uni_id])
    @laboratorio = Laboratorio.find(:all, :conditions => ['unidade_id = ' + $uni_id])
    @administracao = Administracao.find(:all, :conditions => ['unidade_id = ' + $uni_id])
    for estagiario in @estagiario
      estagiario.destroy
    end
    for laboratorio in @laboratorio
      laboratorio.destroy
    end
    for administracao in  @administracao
      administracao.destroy
    end
    @unidades.destroy

  respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end

def mesmo_nome
    $nome = params[:unidade_nome]
    @verifica = Unidade.find_by_nome($nome)
    if @verifica then
      render :update do |page|
        page.replace_html 'nome_aviso', :text => 'UNIDADE JÁ CADASTRADA NO SISTEMA'
        page.replace_html 'Certeza', :text =>'UNIDADE JÁ CADASTRADA NO SISTEMA'
    end
    else
      render :update do |page|
        page.replace_html 'nome_aviso', :text => ''
      end

    end
  end


def consulta
    render :partial => 'consultas'
  end


def lista_unidade
    $unidade = params[:unidade_unidade_id]
    @unidades = Unidade.find(:all, :conditions => ['id=' + $unidade])
    render :partial => 'lista_unidades'
  end

def sem_estagiarios
      #@sem_estagiarios = Unidade.find(:all, :order => 'nome ASC')
      @sem_estagiarios = Unidade.find(:all, :joins => :estagiarios, :conditions => ["estagiarios.desligado",0], :order => 'nome ASC')
      
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sem_estagiarios }
    end
  end


end
