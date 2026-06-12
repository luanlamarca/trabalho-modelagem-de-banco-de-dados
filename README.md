# Projeto: Acolhimento Institucional Infanto Juvenil

### Apresentação e Objetivos

Olá! Meu nome é **Luan de Souza Leonel Lamarca**. Sou Assistente Social e atualmente atuo na rede de proteção especial, especificamente em um **Serviço de Acolhimento Institucional para Crianças e Adolescentes (SAICA)**.

Para contextualizar, o SAICA é um serviço de alta complexidade do Sistema Único de Assistência Social (SUAS). Ele funciona como uma medida protetiva excepcional e provisória, oferecendo moradia, cuidado e proteção integral para crianças e adolescentes que precisaram ser afastados de suas famílias de origem devido a situações de risco, negligência, violência ou abandono. Nosso trabalho diário envolve garantir o bem-estar desses acolhidos enquanto atuamos judicial e socialmente para viabilizar o retorno seguro à família ou o encaminhamento para adoção.

A motivação para o desenvolvimento desta modelagem de banco de dados nasceu diretamente das dores e necessidades que encontro na minha rotina profissional. No dia a dia de um abrigo, a equipe técnica e de cuidados lida com um volume massivo de informações críticas: controle de documentos frequentemente perdidos, prazos rígidos do judiciário, histórico de atendimentos, vínculos familiares e a gestão do Plano Individual de Atendimento (PIA).

O objetivo deste trabalho é aplicar os conhecimentos técnicos adquiridos neste primeiro semestre para propor uma solução tecnológica real. A estrutura deste banco de dados foi desenhada para organizar essa complexidade, permitindo buscas rápidas, cruzamento de informações estratégicas e a geração de relatórios que otimizam o tempo da equipe técnica.

#### Nota sobre a Integridade e Privacidade dos Dados:

Devido ao caráter absolutamente sigiloso e sensível das informações tratadas em um SAICA, **todos os dados inseridos neste projeto são rigorosamente fictícios**. Nomes de crianças, históricos familiares, telefones, documentos e prontuários foram gerados de forma aleatória exclusivamente para fins de simulação e avaliação acadêmica. 

A única exceção presente no banco de dados são os meus próprios dados profissionais (registrados na tabela de colaboradores sob a matrícula MAT-001 como Assistente Social), inseridos para formalizar a autoria técnica.

## Cenário

O Acolhimento Institucional Infantojuvenil é um serviço de proteção social especial de alta complexidade, mantido pela Prefeitura Municipal de Franca, que tem por finalidade oferecer acolhimento provisório a crianças e adolescentes de 0 a 17 anos e 11 meses que se encontram em situação de risco pessoal ou social, cujos vínculos familiares estejam temporariamente rompidos ou fragilizados. O serviço opera em conformidade com o Estatuto da Criança e do Adolescente (ECA), com o Sistema Único de Assistência Social (SUAS) e com as orientações técnicas do Ministério do Desenvolvimento Social para serviços de acolhimento institucional.

O serviço possui capacidade para acolher até 50 crianças e adolescentes simultaneamente em regime de acolhimento ativo. Os registros do sistema contemplam o histórico acumulado do serviço ao longo dos anos, incluindo acolhidos já desligados, famílias encerradas e colaboradores que passaram pelo serviço, o que garante volume de dados suficiente para consultas e relatórios gerenciais.

O serviço é composto por dois grupos de colaboradores. A equipe técnica de referência é formada por uma coordenadora, responsável pela gestão administrativa e técnica do serviço; um assistente social, responsável pelos estudos sociais, relatórios ao judiciário e articulação com a rede de proteção; uma psicóloga, responsável pelo acompanhamento psicoterápico e elaboração de pareceres psicológicos; e uma pedagoga, responsável pelo acompanhamento escolar e realização de atividades socioeducativas. A equipe de cuidado direto é composta por educadores sociais e cuidadores, que atuam em turnos diurnos e noturnos garantindo a proteção, o cuidado e a convivência dos acolhidos no cotidiano institucional, além de auxiliares de serviços gerais e estagiários de cursos como Serviço Social e Psicologia. O sistema registra todos os colaboradores, ativos e desligados, preservando o histórico institucional.

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
* **Acolhido e Família (1:N):** Cada acolhido pertence a uma única família de origem, e uma família pode ter vários acolhidos vinculados no serviço.
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

Fundamental para o nosso trabalho, pois o acolhimento é uma medida provisória. Esta tabela armazena o histórico do endereço e a renda da família, elementos cruciais nos nossos estudos sociais para a avaliação da possibilidade de reintegração familiar.

<img width="1920" height="298" alt="image" src="https://github.com/user-attachments/assets/351ae2b7-cec0-4f49-8e0b-89de71dc7628" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/995f3689-840b-47d1-adbb-a497574a444e" />
<br>
<br>


### Tabela colaborador e telefone_colaborador

Registra a equipe de referência. Como assistente social, sei que a responsabilidade técnica precisa ser rastreável. Esta tabela vincula cada profissional (Assistente Social, Psicólogo, Coordenador) ao seu respectivo registro de conselho, garantindo transparência e ética na gestão do serviço.

<img width="1920" height="437" alt="image" src="https://github.com/user-attachments/assets/06bee1ca-68b9-4d9d-8f42-6e64a48b34ab" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/6875c98a-3613-42d2-bcf2-444a417e7c9c" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/89ee9fa2-fe7a-405b-aafa-041ca7ee2b54" />
<br>
<br>


### Tabela documentos

A falta de documentação civil é um problema constante na nossa rotina. Criei esta tabela para centralizar o controle de certidões, RG, CPF e Cartão SUS, permitindo que a equipe técnica identifique rapidamente o que está pendente para regularizar a vida civil do acolhido.

<img width="1920" height="247" alt="image" src="https://github.com/user-attachments/assets/fb2f02b3-e032-49b8-acb5-1cea9d1cfb9d" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/c882fbfc-e9e2-4e09-a8dc-840481e3435e" />
<br>
<br>


### Tabela acolhido

É o coração do sistema. Esta tabela consolida o histórico de entrada, o motivo do acolhimento e o desfecho (reintegração ou adoção). Ela nos permite extrair dados sobre o tempo de permanência, essencial para evitar que o acolhimento se torne uma medida definitiva por esquecimento ou falta de gestão dos prazos.

<img width="1920" height="382" alt="image" src="https://github.com/user-attachments/assets/c6607999-a475-4f78-97bd-390a898bfee3" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/efebbfd9-1833-4f68-8a33-b39bfa7fc77d" />
<br>
<br>


### Tabelas de responsavel_familia e telefone_familia)

A rede de proteção depende de comunicação rápida. Separei os contatos e os responsáveis em tabelas próprias porque um acolhido pode ter diversos vínculos (avós, tios, pais). Isso nos dá agilidade para acionar a rede em situações de emergência sem perder informações importantes.

<img width="1920" height="319" alt="image" src="https://github.com/user-attachments/assets/21a91552-d1b1-4c89-bfc1-a796a5523916" />
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

<img width="1920" height="203" alt="image" src="https://github.com/user-attachments/assets/9614eb33-fb7c-4570-8125-e7c37cf3ffd9" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/38d8486f-813d-4fd6-bedd-1b34a1c1340a" />
<br>
<br>


### Tabela pia

O Plano Individual de Atendimento é uma exigência técnica do SUAS. Ter uma tabela específica para o PIA garante que tenhamos um registro histórico de todas as revisões feitas pela equipe, demonstrando que o acolhimento está sendo acompanhado de forma ativa.

<img width="1920" height="242" alt="image" src="https://github.com/user-attachments/assets/83f6f15e-af85-4e97-b022-d2b244df1e09" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/f5da6279-67e4-4f0d-987c-96bc50bba62e" />
<br>
<br>


### Tabela atendimento

Documenta todo o trabalho de escuta, visitas domiciliares e reuniões de rede. É aqui que registramos a evolução do caso. Ela permite que qualquer profissional da equipe técnica, ao assumir um plantão ou uma nova demanda, consiga ler o histórico completo e evitar a revitimização do acolhido através de repetições desnecessárias de relatos.

<img width="1920" height="308" alt="image" src="https://github.com/user-attachments/assets/cb580816-2261-42d4-bd6e-0cb17ba6d7a2" />
<br>
<br>
<img width="1872" height="946" alt="image" src="https://github.com/user-attachments/assets/9a035ba8-06b0-4d1a-a7e7-ca8b9e32b316" />
<br>
<br>

## CRUD

As operações de manipulação de dados refletem o dinamismo do cotidiano institucional. No SAICA, o banco de dados é alimentado continuamente à medida que novas intervenções ocorrem, dados familiares mudam, cadastros profissionais são checados e correções de registros de evolução diária são necessárias.

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
