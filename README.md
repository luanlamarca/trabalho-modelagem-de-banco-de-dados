# Projeto: Acolhimento Institucional Infanto Juvenil

### Apresentação e Objetivos

Olá! Meu nome é **Luan de Souza Leonel Lamarca**. Sou Assistente Social e atuo na rede de proteção especial, especificamente em um **Serviço de Acolhimento Institucional para Crianças e Adolescentes (SAICA)**.

Para contextualizar, o SAICA é um serviço de alta complexidade do Sistema Único de Assistência Social (SUAS). Ele funciona como uma medida protetiva excepcional e provisória, oferecendo moradia, cuidado e proteção integral para crianças e adolescentes que precisaram ser afastados de suas famílias de origem devido a situações de risco, negligência, violência ou abandono. Nosso trabalho diário envolve garantir o bem estar desses acolhidos enquanto atuamos judicial e socialmente para viabilizar o retorno seguro à família ou o encaminhamento para adoção.

A motivação para o desenvolvimento desta modelagem de banco de dados nasceu diretamente das dores e necessidades que encontro na minha rotina profissional. No dia a dia de um abrigo, a equipe técnica e de cuidados lida com um volume massivo de informações críticas: controle de documentos, prazos rígidos do judiciário, histórico de atendimentos, vínculos familiares e a gestão do Plano Individual de Atendimento (PIA).

O objetivo deste trabalho é aplicar os conhecimentos técnicos adquiridos neste primeiro semestre para propor uma solução tecnológica real. A estrutura deste banco de dados foi desenhada para organizar essa complexidade, permitindo buscas rápidas, cruzamento de informações estratégicas e a geração de relatórios que otimizam o tempo da equipe técnica.

#### Nota sobre a Integridade e Privacidade dos Dados:

Devido ao caráter absolutamente sigiloso e sensível das informações tratadas em um SAICA, **todos os dados inseridos neste projeto são rigorosamente fictícios**. Nomes de crianças, históricos familiares, telefones, documentos e prontuários foram gerados de forma aleatória exclusivamente para fins de simulação e avaliação acadêmica. 

A única exceção presente no banco de dados são os meus próprios dados profissionais (registrados na tabela de colaboradores sob a matrícula MAT-001 como Assistente Social), inseridos para formalizar a autoria técnica.

### Estrutura da Pasta de Arquivos do Repositório

Abaixo está o índice de arquivos na pasta deste repositório, organizados para acompanhar a linha do tempo de desenvolvimento do projeto. 

*Nota: Todos os arquivos de "Print" (em .pdf) são evidências visuais registradas durante o processo de criação, execução e validação dos dados em cada uma das etapas, contendo data e horário da realização. Algumas das atualizações ao longo do projeto não foram registradas nesta etapa, mas se encontram nos historicos de commits*

* **1. Cenário.rtf / 1.1 Print Cenário.pdf** - 
  Documento de texto contendo a descrição das regras de negócio e a realidade do SAICA que fundamentam o projeto.

* **2. Modelagem Conceitual.png / 2.1 Print Modelagem Conceitual.pdf** - 
  Imagem do Diagrama Entidade-Relacionamento (DER), mapeando as entidades e seus atributos antes da conversão para o banco de dados.

* **3. Modelagem Lógica.png / 3.1 Print Modelagem Lógica.pdf** - 
  Esquema relacional demonstrando como as entidades se conectam através das chaves primárias (PK) e estrangeiras (FK).

* **4. Modelagem Física.sql / 4.1 Print Modelagem Física.pdf** - 
  Script com os comandos CREATE TABLE utilizados para construir a estrutura oficial do banco de dados no SGBD.

* **5. Inserção de Dados.sql / 5.1 Print Inserção de Dados.pdf** - 
  Script com os comandos INSERT responsáveis por inserir no banco de dados o o volume de registros fictícios necessários para as simulações.

* **6. Crude.sql / 6.1 Print Crude.pdf** - 
  Script demonstrando as operações fundamentais de rotina do sistema: criação, leitura, atualização e exclusão (CRUD).

* **7. Relatórios.sql / 7.1 Prints Relatórios.pdf** - 
  Script contendo 10 consultas gerenciais (usando JOINs, agrupamentos e filtros), elaboradas para extrair estatísticas e auxiliar na tomada de decisão técnica.

## Cenário

O Acolhimento Institucional Infantojuvenil é um serviço de proteção social especial de alta complexidade, mantido pela Prefeitura Municipal de Franca, que tem por finalidade oferecer acolhimento provisório a crianças e adolescentes de 0 a 17 anos e 11 meses que se encontram em situação de risco pessoal ou social, cujos vínculos familiares estejam temporariamente rompidos ou fragilizados. O serviço opera em conformidade com o Estatuto da Criança e do Adolescente (ECA), com o Sistema Único de Assistência Social (SUAS) e com as orientações técnicas do Ministério do Desenvolvimento Social para serviços de acolhimento institucional.

O serviço possui capacidade para acolher até 50 crianças e adolescentes simultaneamente em regime de acolhimento ativo. Os registros do sistema contemplam o histórico acumulado do serviço ao longo dos anos, incluindo acolhidos já desligados, famílias encerradas e colaboradores que passaram pelo serviço, o que garante volume de dados suficiente para consultas e relatórios gerenciais.

O serviço é composto por dois grupos de colaboradores. A equipe técnica de referência é formada por coordenador(a), responsável pela gestão administrativa e técnica do serviço; assistente social, responsável pelos estudos sociais, relatórios ao judiciário e articulação com a rede de proteção; psicólogo(a), responsável pelo acompanhamento psicoterápico e elaboração de pareceres psicológicos; e edagogo(a), responsável pelo acompanhamento escolar e realização de atividades socioeducativas. A equipe de cuidado direto é composta por educadores sociais e cuidadoras(es), que atuam em turnos diurnos e noturnos garantindo a proteção, o cuidado e a convivência dos acolhidos no cotidiano institucional, além de auxiliares de serviços gerais e estagiários(as) de cursos como Serviço Social e Psicologia. O sistema registra todos os colaboradores, ativos e desligados, preservando o histórico institucional.

Cada acolhido possui um histórico de atendimentos registrado pela equipe técnica, bem como vínculo com sua família de origem, que é acompanhada durante todo o período de acolhimento com o objetivo de viabilizar a reintegração familiar sempre que possível. Para cada acolhido é elaborado um Plano Individual de Atendimento (PIA), instrumento obrigatório previsto nas orientações técnicas do SUAS, que orienta as ações da equipe e é revisado periodicamente.


## Modelagem Conceitual

A partir da análise do cenário, as regras de negócio foram traduzidas para a modelagem conceitual, identificando as seguintes entidades, seus atributos e classificações:

* **Acolhido:** Cada criança ou adolescente possui um número de prontuário único (atributo chave), nome completo composto por primeiro nome e sobrenome (atributo composto), data de nascimento, idade calculada automaticamente com base na data de nascimento (atributo derivado), sexo e raça/cor. Também são registrados o motivo do acolhimento, a data de entrada, a situação atual (Acolhido ou Desligado) e a data e tipo de desligamento.
* **Colaborador:** Possui uma matrícula funcional única (atributo chave), nome completo composto por primeiro nome e sobrenome (atributo composto), cargo, vínculo empregatício, data de admissão, data de desligamento e e-mail institucional. Profissionais de nível superior têm o número do registro em conselho de classe armazenado. Cada colaborador pode ter mais de um contato telefônico registrado (atributo multivalorado). O tempo de empresa é calculado com base nas datas de admissão e atual/desligamento (atributo derivado).
* **Família de Origem:** Possui um identificador único (atributo chave), nome dos responsáveis (atributo multivalorado), endereço completo composto por logradouro, número, bairro, cidade e CEP (atributo composto), e renda familiar mensal. Também são registrados os contatos telefônicos da família (atributo multivalorado) e o status do acompanhamento.
* **Atendimento:** Cada intervenção da equipe técnica recebe um identificador único (atributo chave), data e horário de realização, tipo (visita domiciliar, escuta, audiência, etc.), descrição e encaminhamento gerado.
* **Documentos:** Controle da documentação civil (RG, CPF, Certidão de Nascimento, etc.). Cada documento possui um identificador (atributo chave), tipo, número, data de emissão e situação atual. 
* **Plano Individual de Atendimento (PIA):** Instrumento de gestão do caso. Recebe um identificador único (atributo chave), data de elaboração, data da última revisão e situação atual do plano.

**Relacionamentos Identificados:**
* **Acolhido e Família (0,1:1,N):** Cada acolhido pertence a uma única família de origem, ou a nenhuma quando não há informações, e uma família pode ter um vários acolhidos vinculados no serviço.
* **Atendimento e Colaborador (1:N):** Cada atendimento é conduzido por um único colaborador, e um colaborador conduz muitos atendimentos.
* **Atendimento e Acolhido (1:N):** Um atendimento está obrigatoriamente vinculado a um acolhido, e um acolhido possui muitos atendimentos registrados no prontuário.
* **Acolhido e Documentos (N:N):** Cada acolhido possui vários documentos, e um mesmo tipo de documento pode estar associado a vários acolhidos no sistema.
* **Acolhido e PIA (1:1):** Cada acolhido possui um único Plano Individual de Atendimento, e cada PIA pertence a um único acolhido.

### Diagrama Entidade-Relacionamento (DER)
<img width="8060" height="4084" alt="Modelagem de Banco de Dados (trabalho final)-Conceitual drawio" src="https://github.com/user-attachments/assets/852648a6-db34-4769-b9fa-d5678cf4862c" />


## Modelagem Lógica

Na etapa de modelagem lógica, o Diagrama Entidade-Relacionamento (DER) foi mapeado para o modelo relacional. Nesta fase, definimos as chaves primárias (PK), chaves estrangeiras (FK) e aplicamos as regras de normalização para resolver os relacionamentos complexos e atributos multivalorados identificados no cenário.

### Resolução de Estruturas e Relacionamentos
* **Resolução de Atributos Multivalorados:** Para respeitar a Primeira Forma Normal (1FN), os atributos que podiam receber múltiplos valores foram transformados em tabelas independentes (ex: telefone_familia, telefone_colaborador e responsavel_familia), vinculadas pela respectiva chave estrangeira.
* **Resolução do Relacionamento N:N (Muitos-para-Muitos):** O relacionamento entre ACOLHIDO e DOCUMENTOS foi resolvido através da tabela associativa acolhido_documento, que utiliza uma chave primária composta pelas chaves estrangeiras de ambas as tabelas.
* **Garantia do Relacionamento 1:1:** Na tabela PIA, a chave estrangeira numero_prontuario_acolhido recebeu uma restrição de unicidade (UNIQUE), garantindo que cada PIA esteja atrelado a um único acolhido.
* **Relacionamentos 1:N:** A integridade referencial foi garantida através da migração das chaves primárias dos lados "1" para os lados "N" das relações, conectando corretamente FAMILIA_DE_ORIGEM -> ACOLHIDO, COLABORADOR -> ATENDIMENTO e ACOLHIDO -> ATENDIMENTO.

### Esquema Relacional
<img width="5236" height="4364" alt="Modelagem de Banco de Dados (trabalho final)-Lógica drawio" src="https://github.com/user-attachments/assets/53a2dedc-911a-494a-a747-201ce13fcf4b" />

## Modelagem Física

A estruturação física deste banco de dados reflete a realidade do fluxo de trabalho no SAICA. O objetivo não é apenas armazenar dados, mas garantir que a informação esteja organizada para subsidiar a tomada de decisão técnica e o atendimento aos direitos da criança e do adolescente.

Abaixo, apresento as tabelas criadas e a justificativa social e administrativa de cada uma:

### Tabela familia_de_origem

Fundamental para o nosso trabalho, pois o acolhimento é uma medida provisória. Esta tabela armazena o histórico do endereço e a renda da família, elementos cruciais nos nossos estudos sociais para a avaliação da possibilidade de reintegração familiar. Entretanto, nem sempre esses dados vem acompanhados com os acolhidos, sendo necessária uma investigação posteriormente pela Equipe Técnica do serviço. 

<img width="1920" height="323" alt="image" src="https://github.com/user-attachments/assets/142ad048-7988-4a03-9315-31792a58f778" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/995f3689-840b-47d1-adbb-a497574a444e" />
<br>
<br>


### Tabela colaborador e telefone_colaborador

Registra a equipe de referência. Esta tabela vincula cada profissional ao seus respectivo dados pessoais. 
<img width="1920" height="483" alt="image" src="https://github.com/user-attachments/assets/8bd251b3-c611-4871-be9a-ae415c556a7e" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/6875c98a-3613-42d2-bcf2-444a417e7c9c" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/89ee9fa2-fe7a-405b-aafa-041ca7ee2b54" />
<br>
<br>


### Tabela documentos

A falta de documentação civil é um problema constante na nossa rotina. Criei esta tabela para centralizar o controle de certidões, RG, CPF e Cartão SUS, permitindo que a equipe técnica identifique rapidamente o que está pendente para regularizar do acolhido.

<img width="1920" height="266" alt="image" src="https://github.com/user-attachments/assets/054b1119-5c6a-4dcc-86dc-a077df02275f" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/c882fbfc-e9e2-4e09-a8dc-840481e3435e" />
<br>
<br>


### Tabela acolhido

Esta tabela consolida o histórico de entrada, o motivo do acolhimento e o desfecho (reintegração ou adoção). Ela nos permite extrair dados sobre o tempo de permanência, essencial para evitar que o acolhimento se torne uma medida definitiva por esquecimento ou falta de gestão dos prazos.

<img width="1920" height="403" alt="image" src="https://github.com/user-attachments/assets/c00e3bf5-53e7-4221-80a8-5b020990b2d8" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/efebbfd9-1833-4f68-8a33-b39bfa7fc77d" />
<br>
<br>


### Tabelas de responsavel_familia e telefone_familia)

A rede de proteção depende de comunicação rápida. Separei os contatos e os responsáveis em tabelas próprias porque um acolhido pode ter diversos vínculos (avós, tios, pais). Isso nos dá agilidade para acionar a rede em situações de emergência sem perder informações importantes.

<img width="1920" height="345" alt="image" src="https://github.com/user-attachments/assets/8d2d5134-7fa5-4b32-8ceb-cc36bc844045" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/0559c617-2ada-48a3-847b-5f078179f38d" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/fe2be460-2ce3-45c6-8d46-61e5fac7a37d" />
<br>
<br>


### Tabela acolhido_documento

Resolve a necessidade prática de associar diversos documentos a uma mesma criança, facilitando o levantamento da documentação necessária para processos judiciais.

<img width="1920" height="226" alt="image" src="https://github.com/user-attachments/assets/883698cb-3136-4079-8b33-7aabd2ad2733" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/38d8486f-813d-4fd6-bedd-1b34a1c1340a" />
<br>
<br>


### Tabela pia

O Plano Individual de Atendimento é uma exigência técnica do SUAS. Ter uma tabela específica para o PIA garante que tenhamos um registro histórico de todas as revisões feitas pela equipe, ou mesmo aqueles que estão pendentes, demonstrando que o acolhimento está sendo acompanhado de forma ativa.

<img width="1920" height="261" alt="image" src="https://github.com/user-attachments/assets/16dd5bda-3a89-43a9-ba70-c5d4e637c9fb" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/f5da6279-67e4-4f0d-987c-96bc50bba62e" />
<br>
<br>


### Tabela atendimento

Documenta todo o trabalho de escuta, visitas domiciliares e reuniões de rede. É aqui que registramos a evolução do caso. Ela permite que qualquer profissional da equipe técnica, ao assumir um plantão ou uma nova demanda, consiga ler o histórico completo e evitar a revitimização do acolhido através de repetições desnecessárias de relatos.

<img width="1920" height="328" alt="image" src="https://github.com/user-attachments/assets/2bca56c4-d090-4108-9b5b-a1958ad47cde" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/9a035ba8-06b0-4d1a-a7e7-ca8b9e32b316" />
<br>
<br>

## CRUD

As operações de manipulação de dados refletem o dinamismo do cotidiano institucional. No SAICA, o banco de dados poderá ser alimentado continuamente à medida que novas intervenções ocorrem, dados familiares mudam, cadastros profissionais são checados e correções de registros de evolução diária são necessárias.

Abaixo estão apresentadas as execuções das quatro operações básicas do sistema, justificadas pela prática do serviço:

### C - Create (Inserção de Registros)
Registra formalmente uma nova intervenção técnica ou evolução de rotina diretamente vinculada ao prontuário do acolhido, documentando o acompanhamento técnico da equipe de referência.

<img width="1920" height="647" alt="Captura de Tela 2026-06-12 às 14 31 58" src="https://github.com/user-attachments/assets/ba5aa6b7-f3a1-48e6-b04a-1ec978fe3bcb" />
<br>
<br>
<img width="1920" height="100" alt="Captura de Tela 2026-06-12 às 14 32 52" src="https://github.com/user-attachments/assets/ac5c8a8c-4514-4a37-a095-5f78fd79e3d1" />
<br>
<br>


### R - Read (Consulta de Registros)
Permite a verificação imediata das informações cadastrais, cargos e números de registros em conselhos de classe (como CRESS ou CRP) dos técnicos responsáveis pelas evoluções e relatórios do serviço.

<img width="1920" height="677" alt="Captura de Tela 2026-06-12 às 14 33 20" src="https://github.com/user-attachments/assets/16517965-94f2-4d97-8747-bf386e9a0cd9" />
<br>
<br>


### U - Update (Atualização de Registros)
Utilizado para manter o estudo socioeconômico atualizado. Quando a renda de uma família de origem sofre alteração durante o período de acompanhamento (seja por inserção no mercado de trabalho ou concessão de benefícios sociais), o dado é imediatamente retificado.

<img width="1920" height="640" alt="Captura de Tela 2026-06-12 às 14 33 52" src="https://github.com/user-attachments/assets/f9bfbeea-7501-455b-8da7-4996595608bb" />
<br>
<br>
<img width="1920" height="175" alt="Captura de Tela 2026-06-12 às 14 34 23" src="https://github.com/user-attachments/assets/02024840-8ac9-4271-8929-75f259c77248" />
<br>
<br>


### D - Delete (Exclusão de Registros)
A exclusão de dados no serviço de acolhimento é restrita a erros materiais e operacionais. Neste caso, o comando remove um registro de atendimento ou evolução que tenha sido inserido com duplicidade ou equívoco de digitação durante o plantão.

<img width="1920" height="636" alt="Captura de Tela 2026-06-12 às 14 34 59" src="https://github.com/user-attachments/assets/b081483e-0f2d-4c1c-ad8d-bb46665496a4" />
<br>
<br>
<img width="1920" height="108" alt="Captura de Tela 2026-06-12 às 14 35 35" src="https://github.com/user-attachments/assets/03fb6766-2c58-40c9-bdb7-5b99c43b8e6e" />
<br>
<br>

## Relatórios

A extração de relatórios estatísticos e gerenciais traduz as linhas do banco de dados em ferramentas de garantia de direitos e diagnósticos sociais. Para a equipe técnica e coordenação do SAICA, o cruzamento dessas informações atende às constantes requisições do Poder Judiciário, Ministério Público e auditorias do SUAS, permitindo monitorar prazos legais e subsidiar ações da rede de proteção do municipio baseadas em evidências do território.

Abaixo estão descritos e implementados os 10 relatórios estratégicos que norteiam a gestão do serviço:

### 1. Relatório de Acolhidos e Responsáveis
Este relatório cruza os dados das crianças acolhidas com os nomes de seus respectivos responsáveis legais e os endereços de origem. É uma ferramenta essencial para o planejamento das ações de aproximação familiar.

<img width="1920" height="996" alt="Captura de Tela 2026-06-12 às 14 54 47" src="https://github.com/user-attachments/assets/a6660218-994f-415a-94dd-d94ae00b35ce" />
<br>
<br>

###  2. PIAs Pendentes
O Plano Individual de Atendimento é um instrumento obrigatório por lei e possui prazos estritos para elaboração. Esta consulta lista todas as crianças cujos planos ainda estão pendentes, permitindo que a coordenação ordene prioridades para que a equipe técnica não ultrapasse o tempo limite determinado pelo Estatuto da Criança e do Adolescente.

<img width="1920" height="996" alt="Captura de Tela 2026-06-12 às 14 55 11" src="https://github.com/user-attachments/assets/2f019ab9-1fea-4067-a409-87ab25c375bb" />
<br>
<br>

### 3. Histórico de Atendimentos por Colaborador
Centraliza e organiza de forma cronológica todas as intervenções, escutas e estudos de caso realizados por um profissional específico da equipe técnica de referência. É fundamental para auditar o fluxo de trabalho individual, monitorar a evolução dos casos e instruir processos de prestação de contas.

<img width="1920" height="996" alt="Captura de Tela 2026-06-12 às 14 55 40" src="https://github.com/user-attachments/assets/8c23130f-0575-4c9e-b3a3-f6f5a13b10e2" />
<br>
<br>

### 4. Desligamento de Acolhidos por Reintegração em Família de Origem
Mapeia os casos históricos e recentes em que o objetivo principal do serviço foi atingido: o retorno seguro da criança ao núcleo familiar de origem. O relatório reúne os nomes dos responsáveis e os endereços, servindo de base para o plano de acompanhamento subsequente durante a etapa de pós-acolhimento.

<img width="1920" height="996" alt="Captura de Tela 2026-06-12 às 14 56 17" src="https://github.com/user-attachments/assets/b5b671e4-a903-42c2-a390-45d0962b19b4" />
<br>
<br>

### 5. Documentação Pendente dos Acolhidos
Levanta em tempo real quais crianças possuem documentos civis extraviados, rasgados ou retidos. A regularização da documentação é o primeiro passo para garantir o acesso a direitos básicos como matrícula escolar, inclusão em programas sociais e atendimento médico especializado.

<img width="1920" height="996" alt="Captura de Tela 2026-06-12 às 14 56 42" src="https://github.com/user-attachments/assets/e0a37603-c999-4c10-ae41-7561bcf5c85b" />
<br>
<br>

### 6. Acolhimento por Abandono Material, Moral ou Intelectual e Bairros
Este relatório cruza a incidência de acolhimentos motivados especificamente por abandono com a distribuição geográfica das famílias pelos bairros de Franca. Trata-se de um indicador essencial para o diagnóstico socioterritorial, permitindo identificar quais regiões necessitam de maior fortalecimento da rede de proteção básica e atuação preventiva dos CRAS.

<img width="1920" height="996" alt="Captura de Tela 2026-06-12 às 14 57 07" src="https://github.com/user-attachments/assets/3f02929c-ec77-4320-94cc-bdfaaf66fa92" />
<br>
<br>

### 7. Acolhimento de Crianças Pretas ou Pardas
Mapeia o perfil étnico racial das crianças ativas no serviço de acolhimento institucional. O monitoramento deste recorte é fundamental para alimentar indicadores locais e nacionais, servindo de base para o enfrentamento de vulnerabilidades específicas e subsidiar o planejamento de políticas afirmativas e protetivas.

<img width="1920" height="996" alt="Captura de Tela 2026-06-12 às 14 57 34" src="https://github.com/user-attachments/assets/cadaabc2-4752-41b3-8cb7-4230db7027a2" />
<br>
<br>

### 8. Tempo de Permanência dos Acolhidos Ativos em Dias
O acolhimento deve ser uma medida estritamente provisória e breve. Esta consulta calcula em dias o tempo exato de permanência de cada acolhido ativo desde a sua data de entrada, gerando o indicador de casos que estejam se estendendo excessivamente.

<img width="1920" height="996" alt="Captura de Tela 2026-06-12 às 14 58 25" src="https://github.com/user-attachments/assets/f1a7b0e6-0222-4b17-8997-0470dd6ae472" />
<br>
<br>

### 9. Tempo de Permanência dos Colaboradores Ativos em Dias
Mapeia o tempo de atuação dos profissionais com vínculo estável dentro da instituição. Na realidade de um abrigo, a baixa rotatividade de colaboradores (especialmente cuidadores e equipe de referência) é um indicador de qualidade, pois garante estabilidade rotineira e a construção de vínculos de apego seguros para as crianças.

<img width="1920" height="996" alt="Captura de Tela 2026-06-12 às 14 58 58" src="https://github.com/user-attachments/assets/e33dda92-32a6-47b2-8846-03bf7bdf782d" />
<br>
<br>

### 10. Acolhidos Ativos que realizam Visitas Domiciliares
Acompanha de forma centralizada as ações de campo em que os acolhidos realizaram visitas externas as suas familias. Garantindo o monitoramento da evolução dos vinculos familiares. 

<img width="1920" height="996" alt="Captura de Tela 2026-06-12 às 14 59 27" src="https://github.com/user-attachments/assets/b96b5c43-1c3f-4012-9933-b882871595ee" />
<br>
<br>

## Considerações Finais 

Chegar ao fim deste projeto tem um significado muito especial para mim. Foi genuinamente prazeroso entender, na prática, como a construção de um banco de dados pode me auxiliar e também a demais profissionais de forma tão direta no dia a dia do meu trabalho na Proteção Social Especial. 

Quando iniciei essa jornada na tecnologia, confesso que os códigos pareciam um mundo distante da minha realidade. Porém, desenhar as tabelas, organizar e cruzar as informações, mesmo que fictícias me fez enxergar o quanto um sistema bem estruturado pode nos libertar daquela burocracia exaustiva.
