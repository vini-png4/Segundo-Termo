-- 1. Apaga o banco de dados antigo se ele já existir (Limpa tudo)
DROP DATABASE IF EXISTS oficina_mecanica;

-- 2. Cria o banco de dados do zero
CREATE DATABASE oficina_mecanica;
USE oficina_mecanica;

-- 3. MARCAS
CREATE TABLE Marcas (
    ID_Marcas INT AUTO_INCREMENT PRIMARY KEY,
    nome_marca VARCHAR(50) NOT NULL UNIQUE,
    fabricado_pais VARCHAR(50),
    nome_cliente VARCHAR(100),
    Modelo VARCHAR(50),
    cor VARCHAR(30)
) COMMENT = 'Tabela de referência e classificação de fabricantes do setor automotivo.';

-- 4. MODELOS
CREATE TABLE Modelos (
    ID_Modelos INT AUTO_INCREMENT PRIMARY KEY,
    ID_Marcas INT NOT NULL,
    nome_modelo VARCHAR(50) NOT NULL,
    motor VARCHAR(30),
    potencia_max VARCHAR(20),
    capacidade_gasolina INT,
    quilometro_hora INT,
    FOREIGN KEY (ID_Marcas) REFERENCES Marcas(ID_Marcas)
) COMMENT = 'Especificação técnica e detalhada dos tipos de veículos ou componentes cadastrados.';

-- 5. CLIENTES
CREATE TABLE Clientes (
    ID_Clientes INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    Telefone VARCHAR(20) NOT NULL,
    Endereco VARCHAR(255),
    Idade INT
) COMMENT = 'Entidade master do sistema. Centraliza os dados de contato e identificação de quem contrata os serviços.';

-- 6. VEÍCULOS
CREATE TABLE Veiculos (
    ID_Veiculos INT AUTO_INCREMENT PRIMARY KEY,
    ID_Modelos INT NOT NULL,
    ID_Clientes INT NOT NULL,
    ano_lancado INT,
    valor DECIMAL(12,2),
    marca VARCHAR(50),
    nome_cliente VARCHAR(100),
    dono_veiculo VARCHAR(100),
    FOREIGN KEY (ID_Modelos) REFERENCES Modelos(ID_Modelos),
    FOREIGN KEY (ID_Clientes) REFERENCES Clientes(ID_Clientes)
) COMMENT = 'Cadastro dos bens físicos que entram na oficina para receber os reparos.';

-- 7. FUNCIONÁRIOS
CREATE TABLE Funcionarios (
    ID_Funcionarios INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    Cargo VARCHAR(50) NOT NULL,
    Turno VARCHAR(20),
    Identificacao VARCHAR(50) UNIQUE
) COMMENT = 'Cadastro de toda a equipe interna da oficina. Controla disponibilidade e auditoria.';

-- 8. SERVIÇOS
CREATE TABLE Servicos (
    ID_Servicos INT AUTO_INCREMENT PRIMARY KEY,
    ID_Clientes INT NOT NULL,
    manutencao_conserto_pintura_lavagem VARCHAR(255),
    Data_entrega DATE,
    FOREIGN KEY (ID_Clientes) REFERENCES Clientes(ID_Clientes)
) COMMENT = 'Catálogo de serviços oferecidos pela oficina. Ponte entre o solicitante e a execução.';

-- 9. ORDENS DE SERVIÇO
CREATE TABLE Ordens_Servico (
    ID_Ordens_Serv INT AUTO_INCREMENT PRIMARY KEY,
    ID_Funcionarios INT NOT NULL,
    ID_Servicos INT NOT NULL,
    funcionario_responsavel VARCHAR(100),
    valor_servico DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    data_servico DATE NOT NULL,
    horario_servico TIME NOT NULL,
    codigo VARCHAR(50) UNIQUE,
    FOREIGN KEY (ID_Funcionarios) REFERENCES Funcionarios(ID_Funcionarios),
    FOREIGN KEY (ID_Servicos) REFERENCES Servicos(ID_Servicos)
) COMMENT = 'Entidade central e operacional. Documenta a execução real, prazos e faturamento do serviço.';

-- 10. PAGAMENTO
CREATE TABLE Pagamento (
    ID_Pagamento INT AUTO_INCREMENT PRIMARY KEY,
    ID_Clientes INT NOT NULL,
    Pix_Debito_boleto_Credito VARCHAR(50) NOT NULL,
    Parcelamento INT NOT NULL DEFAULT 1,
    FOREIGN KEY (ID_Clientes) REFERENCES Clientes(ID_Clientes)
) COMMENT = 'Entidade financeira que registra a baixa e a forma de liquidação dos valores gerados.';

-- 11. FORNECEDORES
CREATE TABLE Fornecedores (
    ID_Fornecedores INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    Empresa VARCHAR(100) NOT NULL,
    marca VARCHAR(50),
    pais VARCHAR(50) DEFAULT 'Brasil',
    entrega VARCHAR(50)
) COMMENT = 'Registro das empresas parceiras que vendem ou entregam insumos para a oficina.';

-- 12. PEÇAS
CREATE TABLE Pecas (
    ID_Peças INT AUTO_INCREMENT PRIMARY KEY,
    ID_Fornecedores INT NOT NULL,
    nome_peca VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    preco DECIMAL(10,2) NOT NULL,
    tamanho VARCHAR(30),
    peso DECIMAL(6,3),
    FOREIGN KEY (ID_Fornecedores) REFERENCES Fornecedores(ID_Fornecedores)
) COMMENT = 'Controle físico e financeiro do inventário/estoque da oficina.';