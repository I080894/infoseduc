class EstagiariosController < ApplicationController
  # GET /estagiarios
  # GET /estagiarios.xml
  layout "application"

   before_filter :load_unidades
   before_filter :load_estagiarios
   before_filter :load_analistas
   before_filter :load_estagiariosa
   before_filter :load_regiaos

def load_regiaos
    @regiaos = Regiao.find(:all)
end

def load_estagiariosa
    @estagiariosa = Estagiario.find(:all, :order => 'nome ASC',:conditions => ['flag=? and desligado=?',0,0])
end


def load_analistas
    @analistas = Estagiario.find(:all, :order => 'nome ASC', :conditions => ['flag=?',1])
end

def load_estagiarios
    @estagiarios = Estagiario.find(:all, :order => 'nome ASC',:conditions => ['flag=?',0])
  end

   def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end
  
  def index
   if (params[:search].nil? || params[:search].empty?)
      @estagiarios = Estagiario.paginate :page => params[:page], :conditions =>['desligado=?',0], :order => 'nome ASC', :per_page => 16
      $var = 0
    else
      @estagiarios = Estagiario.find(:all, :conditions => (["nome like ?", "%" + params[:search].to_s + "%" ]), :order => 'nome ASC')
       $var = 1
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @estagiarios }
    end
  end


  # GET /estagiarios/1
  # GET /estagiarios/1.xml
  def show
    @estagiarios = Estagiario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @estagiarios }
    end
  end

  # GET /estagiarios/new
  # GET /estagiarios/new.xml
  def new
    @estagiarios = Estagiario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @estagiarios }
    end
  end

  # GET /estagiarios/1/edit
  def edit
    @estagiarios = Estagiario.find(params[:id])
  end

  # POST /estagiarios
  # POST /estagiarios.xml
  def create
    @estagiarios = Estagiario.new(params[:estagiario])

    respond_to do |format|
      if @estagiarios.save
        flash[:notice] = 'ESTAGIÁRIO CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@estagiarios) }
        format.xml  { render :xml => @estagiarios, :status => :created, :location => @estagiarios }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @estagiarios.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /estagiarios/1
  # PUT /estagiarios/1.xml
  def update
    @estagiarios = Estagiario.find(params[:id])

    respond_to do |format|
      if @estagiarios.update_attributes(params[:estagiario])
        flash[:notice] = 'ESTAGIÁRIO SALVO COM SUCESSO.'
        format.html { redirect_to(@estagiarios) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @estagiarios.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /estagiarios/1
  # DELETE /estagiarios/1.xml
  def destroy
    @estagiarios = Estagiario.find(params[:id])
    @estagiarios.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end

  def mesmo_nome
    $nome = params[:estagiario_nome]
    @verifica = Estagiario.find_by_nome($nome)
    if @verifica then
      render :update do |page|
        page.replace_html 'nome_aviso', :text => 'ESTAGIÁRIO JÁ CADASTRADA NO SISTEMA'
        page.replace_html 'Certeza', :text =>'ESTAGIÁRIO JÁ CADASTRADA NO SISTEMA'
    end
    else
      render :update do |page|
        page.replace_html 'nome_aviso', :text => ''
      end

    end
  end

    def nome_unidade
   $unidade = params[:estagiario_unidade_id]
   @estagariounidade = Unidade.find(:all, :include => 'estagiarios', :conditions => ['id =?',$unidade])
   $nomeunidade= Unidade.find_by_id($unidade).nome
     render :update do |page|
       page.replace_html 'unidade_nome', :partial => 'exibe_unidade'
    end
  end

 def consulta
    render 'consultas'
  end

def lista_estagiario
    $estagiario = params[:estagiario_estagiario_id]
    @estagiarios = Estagiario.find(:all, :conditions => ['id=' + $estagiario])
    render :partial => 'lista_estagiarios'
  end

def analistas
     if (params[:search].nil? || params[:search].empty?)
       @analistas = Estagiario.paginate :page => params[:page], :conditions =>['flag=?',1], :order => 'nome ASC', :per_page => 10
      $var = 0
    else
      @analistas = Estagiario.find(:all, :conditions => (["nome like ? and flag=?", "%" + params[:search].to_s + "%",1 ]), :order => 'nome ASC')
       $var = 1
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @analistas }
    end
  end

def baixas
  if (params[:search].nil? || params[:search].empty?)
     @baixas = Estagiario.find(:all, :order => 'nome ASC', :conditions => ['desligado=?',1])
      $var = 0
    else
      @baixas = Estagiario.find(:all, :conditions => ["nome like ? and desligado = 1","%" + params[:search].to_s + "%"], :order => 'nome ASC')
       $var = 1
    end
    # @baixas = Estagiario.find(:all, :order => 'nome ASC', :conditions => ['desligado=?',1])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @analistas }
    end
  end

def seleciona
    $periodo = params[:estagiario_periodo_trab]
    if ($periodo == 'ITINERANTE')then
       render :partial => 'selecao_regiaos'
    else
       @unidades= Unidade.find(:all, :conditions => "regiao_id is null")
       render :partial => 'selecao_unidades'
    end
  end

 def regiao_unidade
   $regiao = params[:estagiario_regiao_id]
   if ($regiao == 6) then
     @unidades = Unidade.find(:all)
      render :update do |page|
        page.replace_html 'selecao', :partial => 'selecao_unidades'
    end
     
   else
     @unidades = Unidade.find :all, :conditions => {:regiao_id => params[:estagiario_regiao_id]}
      render :update do |page|
       page.replace_html 'selecao', :partial => 'selecao_unidades'
    end
   end
end

  

end
