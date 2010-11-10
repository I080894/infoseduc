class SeducsController < ApplicationController
  # GET /seducs
  # GET /seducs.xml
   before_filter :load_departamentos

def load_departamentos
    @departamentos = Departamento.find(:all, :order => 'depto ASC')
  end


  def index
    if (params[:search].nil? || params[:search].empty?)
      @seducs = Seduc.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 9
      $var = 0
    else
      @seducs = Seduc.find(:all, :joins => :departamento, :conditions => ["departamentos.depto like ?", "%" + params[:search].to_s + "%"], :order => 'depto ASC')
      $var = 1
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @seducs }
    end
  end

  # GET /seducs/1
  # GET /seducs/1.xml
  def show
    @seduc = Seduc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @seduc }
    end
  end

  # GET /seducs/new
  # GET /seducs/new.xml
  def new
    @seduc = Seduc.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @seduc }
    end
  end

  # GET /seducs/1/edit
  def edit
    @seduc = Seduc.find(params[:id])
  end

  # POST /seducs
  # POST /seducs.xml
  def create
    @seduc = Seduc.new(params[:seduc])

    respond_to do |format|
      if @seduc.save
        flash[:notice] = 'EQUIPAMENTO CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@seduc) }
        format.xml  { render :xml => @seduc, :status => :created, :location => @seduc }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @seduc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /seducs/1
  # PUT /seducs/1.xml
  def update
    @seduc = Seduc.find(params[:id])

    respond_to do |format|
      if @seduc.update_attributes(params[:seduc])
        flash[:notice] = 'EQUIPAMENTO SALVO COM SUCESSO.'
        format.html { redirect_to(@seduc) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @seduc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /seducs/1
  # DELETE /seducs/1.xml
  def destroy
    @seduc = Seduc.find(params[:id])
    @seduc.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end

def departamento_nome

    $jaexiste = params[:seduc_departamento_id]
    @verifica = Seduc.find_by_departamento_id($jaexiste)
    if @verifica then
      render :update do |page|
        page.replace_html 'aviso', :text => 'EQUIPAMENTO JÁ CADASTADO NO SISTEMA'
        page.replace_html 'Certeza', :text =>'EQUIPAMENTO JÁ CADASTADO NO SISTEMA'
    end
    else
      $departamento = params[:seduc_departamento_id]
      @seducdepartamento = Departamento.find(:all, :include => 'seducs', :conditions => ['id =?',$departamento])
      $nomedepartamento= Departamento.find_by_id($departamento).depto

       render :update do |page|
       page.replace_html 'nome_departamento', :partial => 'exibe_departamento'
       page.replace_html 'aviso', :text => ''
      end

    end
  end


def consulta
    render :partial => 'consultas'
  end


def lista_departamentos
    $departamento = params[:seduc_departamento_id]
    @seducs = Seduc.find(:all, :conditions => ['departamento_id=' + $departamento])
    render :partial => 'lista_seducs'
  end
end

