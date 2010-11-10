class LaboratoriosController < ApplicationController
  # GET /laboratorios
  # GET /laboratorios.xml
  layout "application"


   before_filter :load_unidades
   before_filter :load_laboratorios


   def load_laboratorios
    @laboratorios = Laboratorio.find(:all)
  end


   def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end


  def index
    if (params[:search].nil? || params[:search].empty?)
      @laboratorios = Laboratorio.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 9
      $var = 0
    else
      @laboratorios = Laboratorio.find(:all, :joins => :unidade, :conditions => ["unidades.nome like ?", "%" + params[:search].to_s + "%"], :order => 'nome ASC')
      $var=1
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @laboratorios }
    end
  end

  # GET /laboratorios/1
  # GET /laboratorios/1.xml
  def show
    @laboratorios = Laboratorio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @laboratorios }
    end
  end

  # GET /laboratorios/new
  # GET /laboratorios/new.xml
  def new
    @laboratorios = Laboratorio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @laboratorios }
    end
  end

  # GET /laboratorios/1/edit
  def edit
    @laboratorios = Laboratorio.find(params[:id])
  end

  # POST /laboratorios
  # POST /laboratorios.xml
  def create
    @laboratorios = Laboratorio.new(params[:laboratorio])

    respond_to do |format|
      if @laboratorios.save
        flash[:notice] = 'LABORATÓRIO CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@laboratorios) }
        format.xml  { render :xml => @laboratorios, :status => :created, :location => @laboratorios }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @laboratorios.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /laboratorios/1
  # PUT /laboratorios/1.xml
  def update
    @laboratorios = Laboratorio.find(params[:id])

    respond_to do |format|
      if @laboratorios.update_attributes(params[:laboratorio])
        flash[:notice] = 'LABORATÓRIO SALVO COM SUCESSO.'
        format.html { redirect_to(@laboratorios) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @laboratorios.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratorios/1
  # DELETE /laboratorios/1.xml
  




  def destroy
    @laboratorios = Laboratorio.find(params[:id])
    @laboratorios.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end


 

    def nome_unidade

    $jaexiste = params[:laboratorio_unidade_id]
    @verifica = Laboratorio.find_by_unidade_id($jaexiste)
    if @verifica then
      render :update do |page|
        page.replace_html 'nome_aviso', :text => 'LABORATÓRIO DA UNIDADE JÁ CADASTADO NO SISTEMA'
        page.replace_html 'Certeza', :text =>'LABORATÓRIO DA UNIDADE JÁ CADASTADO NO SISTEMA'
    end
    else
      $unidade = params[:laboratorio_unidade_id]
      @laboratoriounidade = Unidade.find(:all, :include => 'estagiarios', :conditions => ['id =?',$unidade])
      $nomeunidade= Unidade.find_by_id($unidade).nome
       render :update do |page|
       page.replace_html 'unidade_nome', :partial => 'exibe_unidade'
       page.replace_html 'nome_aviso', :text => ''
      end

    end



  end

def consulta
    render :partial => 'consultas'
  end


def lista_laboratorio
    $unidade = params[:laboratorio_unidade_id]
    @laboratorios = Laboratorio.find(:all, :conditions => ['unidade_id='+ $unidade],:order => 'data DESC')
    render :partial => 'lista_laboratorios'
  end


end


