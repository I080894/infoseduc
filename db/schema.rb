# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101210112302) do

  create_table "administracaos", :force => true do |t|
    t.integer  "unidade_id",       :null => false
    t.integer  "tipo_controle_id"
    t.string   "servidor"
    t.string   "rede"
    t.string   "internet"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chamados", :force => true do |t|
    t.datetime "data_sol"
    t.string   "solicitante"
    t.integer  "unidade_id"
    t.string   "depto"
    t.string   "forma_sol"
    t.string   "problema"
    t.datetime "data_aten"
    t.integer  "estagiario_id"
    t.integer  "tipos_problema_id"
    t.integer  "patrimonio"
    t.string   "local"
    t.string   "procedimentos"
    t.integer  "situacao_chamado_id", :default => 1
    t.datetime "data_enc"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "componentes", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "computadores", :force => true do |t|
    t.integer  "unidade_id"
    t.integer  "tipo_controle_id"
    t.integer  "quant"
    t.string   "config"
    t.string   "pat"
    t.string   "user"
    t.string   "pertence"
    t.string   "contato"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "datashows", :force => true do |t|
    t.integer  "unidade_id"
    t.integer  "tipo_controle_id"
    t.integer  "quant"
    t.string   "config"
    t.string   "pat"
    t.string   "user"
    t.string   "pertence"
    t.string   "contato"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departamentos", :force => true do |t|
    t.integer  "unidade_id", :default => 53
    t.string   "depto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emfaltas", :force => true do |t|
    t.integer  "componente_id"
    t.string   "especifica"
    t.integer  "quant"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emprestimos", :force => true do |t|
    t.integer  "unidade_id"
    t.datetime "emprestimo"
    t.datetime "devolucao"
    t.string   "responsavel"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entradas", :force => true do |t|
    t.integer  "componente_id"
    t.integer  "estoque_id"
    t.integer  "quantidade"
    t.datetime "data_ent"
    t.string   "procedencia"
    t.string   "NF"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estagiarios", :force => true do |t|
    t.integer  "unidade_id"
    t.integer  "regiao_id"
    t.string   "nome"
    t.string   "RG"
    t.string   "CPF"
    t.string   "endereco"
    t.integer  "num"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "fone"
    t.string   "cel"
    t.string   "email"
    t.datetime "data_nasc"
    t.string   "faculdade"
    t.string   "matricula"
    t.string   "periodo_est"
    t.string   "responsavel"
    t.datetime "data_ingresso"
    t.datetime "data_termino"
    t.datetime "data_admissao"
    t.datetime "data_desliga"
    t.string   "locacao"
    t.string   "periodo_trab"
    t.string   "aval"
    t.string   "obs"
    t.integer  "flag",          :default => 0
    t.integer  "desligado",     :default => 0
    t.integer  "etinerante",    :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estoques", :force => true do |t|
    t.integer  "componente_id",                :null => false
    t.string   "especifica"
    t.integer  "saldo",         :default => 0
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fornecedores", :force => true do |t|
    t.string   "nome"
    t.string   "endereco"
    t.integer  "num"
    t.string   "complemento"
    t.string   "cidade"
    t.string   "fone"
    t.string   "cel"
    t.string   "email"
    t.string   "contato"
    t.string   "tipo_servico"
    t.string   "aval"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "impressoras", :force => true do |t|
    t.integer  "unidade_id"
    t.integer  "tipo_controle_id"
    t.integer  "quant"
    t.string   "config"
    t.string   "pat"
    t.string   "user"
    t.string   "pertence"
    t.string   "contato"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itinerarios", :force => true do |t|
    t.integer  "estagiario_id"
    t.integer  "unidade_id"
    t.date     "data_visita"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regiaos", :force => true do |t|
    t.string   "regiao"
    t.string   "local"
    t.string   "unidade"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relatorios", :force => true do |t|
    t.integer  "unidade_id"
    t.integer  "estagiario_id"
    t.string   "responsavel"
    t.datetime "data"
    t.string   "problema"
    t.string   "procedimentos"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "saidas", :force => true do |t|
    t.integer  "componente_id"
    t.integer  "estoque_id"
    t.integer  "estagiario_id"
    t.integer  "unidade_id"
    t.integer  "quantidade"
    t.datetime "data_saida"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "senhas", :force => true do |t|
    t.integer  "unidade_id", :null => false
    t.string   "de"
    t.string   "usuario"
    t.string   "senha"
    t.string   "fone"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "situacao_chamados", :force => true do |t|
    t.string   "situacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_controles", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_problemas", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unidades", :force => true do |t|
    t.integer  "tipo_id",                    :null => false
    t.integer  "regiao_id"
    t.string   "nome"
    t.string   "endereco"
    t.integer  "num"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "fone"
    t.string   "email"
    t.string   "diretor"
    t.string   "coordenador"
    t.string   "obs"
    t.integer  "estagiarioM", :default => 0, :null => false
    t.integer  "estagiarioV", :default => 0, :null => false
    t.integer  "estagiarioE", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
  end

end
