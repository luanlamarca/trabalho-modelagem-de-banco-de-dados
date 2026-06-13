-- 1. Relatório de Acolhidos e Responsáveis
SELECT 
    acolhido.primeiro_nome, 
    responsavel_familia.nome_responsavel, 
    familia_de_origem.endereco_logradouro
FROM acolhido
JOIN familia_de_origem ON acolhido.id_familia = familia_de_origem.id
JOIN responsavel_familia ON familia_de_origem.id = responsavel_familia.id_familia
WHERE acolhido.situacao_atual = 'Acolhido'
ORDER BY acolhido.data_acolhimento DESC;

-- 2. PIAs Pendentes
SELECT 
    acolhido.numero_prontuario,
    acolhido.primeiro_nome, 
    acolhido.data_acolhimento, 
    pia.situacao_atual
FROM acolhido
JOIN pia ON acolhido.numero_prontuario = pia.numero_prontuario_acolhido
WHERE pia.situacao_atual = 'Pendente'
ORDER BY acolhido.data_acolhimento ASC;

-- 3. Histórico de Atendimentos por Colaborador
SELECT 
    colaborador.primeiro_nome, 
    colaborador.cargo, 
    atendimento.tipo, 
    atendimento.data_realizacao, 
    acolhido.numero_prontuario
FROM atendimento
JOIN colaborador ON atendimento.matricula_colaborador = colaborador.matricula
JOIN acolhido ON atendimento.numero_prontuario_acolhido = acolhido.numero_prontuario
WHERE colaborador.matricula = 'MAT-001'
ORDER BY atendimento.data_realizacao DESC;

-- 4. Desligamento de Acolhidos por Reintegração em Familia de Origem  
SELECT 
    acolhido.numero_prontuario,
    acolhido.primeiro_nome, 
    acolhido.data_desligamento, 
    responsavel_familia.nome_responsavel,
    familia_de_origem.endereco_logradouro,
    familia_de_origem.endereco_numero
FROM acolhido
JOIN familia_de_origem ON acolhido.id_familia = familia_de_origem.id
JOIN responsavel_familia ON familia_de_origem.id = responsavel_familia.id_familia
WHERE acolhido.tipo_desligamento = 'Reintegração Familiar'
ORDER BY acolhido.data_desligamento DESC;

-- 5. Ducumentação Pendente dos Acolhidos
SELECT 
    acolhido.numero_prontuario,
    acolhido.primeiro_nome, 
    documentos.tipo, 
    documentos.situacao
FROM acolhido_documento
JOIN acolhido ON acolhido_documento.numero_prontuario_acolhido = acolhido.numero_prontuario
JOIN documentos ON acolhido_documento.id_documento = documentos.id
WHERE documentos.situacao != 'Ativo'
ORDER BY acolhido.primeiro_nome ASC;

-- 6. Acolhimento por Abandono Material, Moral ou Intelectual e Bairros 
SELECT 
    acolhido.numero_prontuario,
    acolhido.primeiro_nome, 
    acolhido.motivo_acolhimento, 
    familia_de_origem.endereco_bairro
FROM acolhido
JOIN familia_de_origem ON acolhido.id_familia = familia_de_origem.id
WHERE acolhido.motivo_acolhimento = 'Abandono material, moral ou intelectual'
ORDER BY acolhido.primeiro_nome ASC;

--7. Acolhimento de Crianças Pretas ou Pardas
SELECT 
    acolhido.numero_prontuario,
    acolhido.primeiro_nome, 
    acolhido.raca_cor
FROM acolhido
JOIN familia_de_origem ON acolhido.id_familia = familia_de_origem.id
WHERE acolhido.situacao_atual = 'Acolhido' 
  AND acolhido.raca_cor IN ('Preta', 'Parda')
ORDER BY acolhido.raca_cor ASC, acolhido.primeiro_nome ASC;

-- 8. Tempo de Permanencia dos Acolhidos Ativos em Dias
SELECT 
    acolhido.numero_prontuario,
    acolhido.primeiro_nome, 
    acolhido.data_acolhimento,
    CURRENT_DATE - acolhido.data_acolhimento AS dias_em_acolhimento,
    pia.situacao_atual
FROM acolhido
JOIN pia ON acolhido.numero_prontuario = pia.numero_prontuario_acolhido
WHERE acolhido.situacao_atual = 'Acolhido'
ORDER BY dias_em_acolhimento DESC; 

-- 9. Tempo de Permanencia dos Colaboradores Ativos em Dias
SELECT 
    colaborador.matricula,
    colaborador.primeiro_nome, 
    colaborador.cargo,
    colaborador.data_admissao,
    CURRENT_DATE - colaborador.data_admissao AS dias_de_empresa
FROM colaborador
JOIN telefone_colaborador ON colaborador.matricula = telefone_colaborador.matricula_colaborador
WHERE vinculo_empregaticio = 'Efetivo'
ORDER BY dias_de_empresa DESC;

--10. Acolhidos Ativos que realizam Visitas Domiciliares
SELECT 
    acolhido.numero_prontuario,
    acolhido.primeiro_nome AS nome_crianca,
    atendimento.tipo,
    atendimento.data_realizacao,
    colaborador.primeiro_nome AS nome_colaborador,
    colaborador.cargo
FROM acolhido
JOIN atendimento ON acolhido.numero_prontuario = atendimento.numero_prontuario_acolhido
JOIN colaborador ON atendimento.matricula_colaborador = colaborador.matricula
WHERE acolhido.situacao_atual = 'Acolhido' 
  AND atendimento.tipo IN ('Visita Domiciliar')
ORDER BY atendimento.data_realizacao DESC;
