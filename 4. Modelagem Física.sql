CREATE TABLE familia_de_origem (
  id SERIAL PRIMARY KEY,
  endereco_logradouro VARCHAR(100),
  endereco_numero VARCHAR(20),
  endereco_bairro VARCHAR(50),
  endereco_cidade VARCHAR(50),
  endereco_cep VARCHAR(9),
  renda_familiar_mensal DECIMAL(10,2),
  acompanhamento VARCHAR(30) NOT NULL
);

CREATE TABLE colaborador (
  matricula VARCHAR(50) PRIMARY KEY,
  primeiro_nome VARCHAR(50) NOT NULL,
  sobrenome VARCHAR(100) NOT NULL,
  cpf VARCHAR(11) NOT NULL UNIQUE,
  cargo VARCHAR(50) NOT NULL,
  registro_conselho VARCHAR(20),
  email_institucional VARCHAR(100) NOT NULL UNIQUE,
  vinculo_empregaticio VARCHAR(50),
  data_admissao DATE NOT NULL,
  data_desligamento DATE
);

CREATE TABLE documentos (
  id SERIAL PRIMARY KEY,
  tipo VARCHAR(50) NOT NULL,
  numero_documento VARCHAR(50) NOT NULL UNIQUE,
  data_emissao DATE NOT NULL,
  situacao VARCHAR(30) NOT NULL
);

CREATE TABLE responsavel_familia (
  id_responsavel SERIAL PRIMARY KEY,
  id_familia INT REFERENCES familia_de_origem(id),
  nome_responsavel VARCHAR(100)
);

CREATE TABLE telefone_familia (
  id_telefone SERIAL PRIMARY KEY,
  id_familia INT REFERENCES familia_de_origem(id),
  numero_telefone VARCHAR(15)
);

CREATE TABLE telefone_colaborador (
  id_telefone SERIAL PRIMARY KEY,
  matricula_colaborador VARCHAR(50) NOT NULL REFERENCES colaborador(matricula),
  numero_telefone VARCHAR(15) NOT NULL
);

CREATE TABLE acolhido (
    numero_prontuario VARCHAR(20) PRIMARY KEY,
    id_familia INT REFERENCES familia_de_origem(id) NULL,
    primeiro_nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo VARCHAR(20) NOT NULL,
    raca_cor VARCHAR(30) NOT NULL,
    situacao_atual VARCHAR(50) NOT NULL,
    data_acolhimento DATE NOT NULL,
    motivo_acolhimento VARCHAR(500),
    data_desligamento DATE,
    tipo_desligamento VARCHAR(50)
);

CREATE TABLE acolhido_documento (
    numero_prontuario_acolhido VARCHAR(20) REFERENCES acolhido(numero_prontuario),
    id_documento INT REFERENCES documentos(id),
    PRIMARY KEY (numero_prontuario_acolhido, id_documento)
);

CREATE TABLE pia (
    id SERIAL PRIMARY KEY,
    numero_prontuario_acolhido VARCHAR(20) NOT NULL UNIQUE REFERENCES acolhido(numero_prontuario),
    data_elaboracao DATE NOT NULL DEFAULT CURRENT_DATE,
    data_ultima_revisao DATE,
    situacao_atual VARCHAR(30) NOT NULL
);

CREATE TABLE atendimento (
    id SERIAL PRIMARY KEY,
    numero_prontuario_acolhido VARCHAR(20) NOT NULL REFERENCES acolhido(numero_prontuario),
    matricula_colaborador VARCHAR(50) NOT NULL REFERENCES colaborador(matricula),
    data_realizacao DATE NOT NULL DEFAULT CURRENT_DATE,
    horario_realizacao TIME,
    tipo VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL,
    encaminhamento TEXT
);
