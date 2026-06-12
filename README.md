# Projeto: Acolhimento Institucional Infanto Juvenil

### Apresentação e Objetivos

Olá! Meu nome é **Luan de Souza Leonel Lamarca**. Sou Assistente Social e atualmente atuo na rede de proteção especial, especificamente em um **Serviço de Acolhimento Institucional para Crianças e Adolescentes (SAICA)**.

Para contextualizar, o SAICA é um serviço de alta complexidade do Sistema Único de Assistência Social (SUAS). Ele funciona como uma medida protetiva excepcional e provisória, oferecendo moradia, cuidado e proteção integral para crianças e adolescentes que precisaram ser afastados de suas famílias de origem devido a situações de risco, negligência, violência ou abandono. Nosso trabalho diário envolve garantir o bem-estar desses acolhidos enquanto atuamos judicial e socialmente para viabilizar o retorno seguro à família ou o encaminhamento para adoção.

A motivação para o desenvolvimento desta modelagem de banco de dados nasceu diretamente das dores e necessidades que encontro na minha rotina profissional. No dia a dia de um abrigo, a equipe técnica e de cuidados lida com um volume massivo de informações críticas: controle de documentos frequentemente perdidos, prazos rígidos do judiciário, histórico de atendimentos, vínculos familiares e a gestão do Plano Individual de Atendimento (PIA).

O objetivo deste trabalho é aplicar os conhecimentos técnicos adquiridos neste primeiro semestre para propor uma solução tecnológica real. A estrutura deste banco de dados foi desenhada para organizar essa complexidade, permitindo buscas rápidas, cruzamento de informações estratégicas e a geração de relatórios que otimizam o tempo da equipe técnica.

#### Nota sobre a Integridade e Privacidade dos Dados:

Devido ao caráter absolutamente sigiloso e sensível das informações tratadas em um SAICA, **todos os dados inseridos neste projeto são rigorosamente fictícios**. Nomes de crianças, históricos familiares, telefones, documentos e prontuários foram gerados de forma aleatória exclusivamente para fins de simulação e avaliação acadêmica. 

A única exceção presente no banco de dados são os meus próprios dados profissionais (registrados na tabela de colaboradores sob a matrícula MAT-001 como Assistente Social), inseridos para formalizar a autoria técnica.

## 1. Cenário

O Acolhimento Institucional Infantojuvenil é um serviço de proteção social especial de alta complexidade, mantido pela Prefeitura Municipal de Franca, que tem por finalidade oferecer acolhimento provisório a crianças e adolescentes de 0 a 17 anos e 11 meses que se encontram em situação de risco pessoal ou social, cujos vínculos familiares estejam temporariamente rompidos ou fragilizados. O serviço opera em conformidade com o Estatuto da Criança e do Adolescente (ECA), com o Sistema Único de Assistência Social (SUAS) e com as orientações técnicas do Ministério do Desenvolvimento Social para serviços de acolhimento institucional.

O serviço possui capacidade para acolher até 50 crianças e adolescentes simultaneamente em regime de acolhimento ativo. Os registros do sistema contemplam o histórico acumulado do serviço ao longo dos anos, incluindo acolhidos já desligados, famílias encerradas e colaboradores que passaram pelo serviço, o que garante volume de dados suficiente para consultas e relatórios gerenciais.

O serviço é composto por dois grupos de colaboradores. A equipe técnica de referência é formada por uma coordenadora, responsável pela gestão administrativa e técnica do serviço; um assistente social, responsável pelos estudos sociais, relatórios ao judiciário e articulação com a rede de proteção; uma psicóloga, responsável pelo acompanhamento psicoterápico e elaboração de pareceres psicológicos; e uma pedagoga, responsável pelo acompanhamento escolar e realização de atividades socioeducativas. A equipe de cuidado direto é composta por educadores sociais e cuidadores, que atuam em turnos diurnos e noturnos garantindo a proteção, o cuidado e a convivência dos acolhidos no cotidiano institucional, além de auxiliares de serviços gerais e estagiários de cursos como Serviço Social e Psicologia. O sistema registra todos os colaboradores, ativos e desligados, preservando o histórico institucional.

Cada acolhido possui um histórico de atendimentos registrado pela equipe técnica, bem como vínculo com sua família de origem, que é acompanhada durante todo o período de acolhimento com o objetivo de viabilizar a reintegração familiar sempre que possível. Para cada acolhido é elaborado um Plano Individual de Atendimento (PIA), instrumento obrigatório previsto nas orientações técnicas do SUAS, que orienta as ações da equipe e é revisado periodicamente.


## 2. Modelagem Conceitual

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


## 3. Modelagem Lógica

Na etapa de modelagem lógica, o Diagrama Entidade-Relacionamento (DER) foi mapeado para o modelo relacional. Nesta fase, definimos as chaves primárias (PK), chaves estrangeiras (FK) e aplicamos as regras de normalização para resolver os relacionamentos complexos e atributos multivalorados identificados no cenário.

### Resolução de Estruturas e Relacionamentos
* **Resolução de Atributos Multivalorados:** Para respeitar a Primeira Forma Normal (1FN), os atributos que podiam receber múltiplos valores foram transformados em tabelas independentes (ex: telefone_familia, telefone_colaborador e responsavel_familia), vinculadas pela respectiva chave estrangeira.
* **Resolução do Relacionamento N:N (Muitos-para-Muitos):** O relacionamento entre ACOLHIDO e DOCUMENTOS foi resolvido através da tabela associativa acolhido_documento, que utiliza uma chave primária composta pelas chaves estrangeiras de ambas as tabelas.
* **Garantia do Relacionamento 1:1:** Na tabela PIA, a chave estrangeira numero_prontuario_acolhido recebeu uma restrição de unicidade (UNIQUE), garantindo que cada PIA esteja atrelado a um único acolhido.
* **Relacionamentos 1:N:** A integridade referencial foi garantida através da migração das chaves primárias dos lados "1" para os lados "N" das relações, conectando corretamente FAMILIA_DE_ORIGEM -> ACOLHIDO, COLABORADOR -> ATENDIMENTO e ACOLHIDO -> ATENDIMENTO.

### Esquema Relacional
<img width="5236" height="4364" alt="Modelagem de Banco de Dados (trabalho final)-Lógica drawio" src="https://github.com/user-attachments/assets/53a2dedc-911a-494a-a747-201ce13fcf4b" />
