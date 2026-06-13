-- Create
INSERT INTO atendimento (numero_prontuario_acolhido, matricula_colaborador, data_realizacao, horario_realizacao, tipo, descricao, encaminhamento) 
VALUES ('PRONT-2024-051', 'MAT-001', '2026-06-12', '08:30', 'Evolução', 'Atualização cadastral e verificação de documentos.', 'Sem encaminhamentos');

-- Read
SELECT primeiro_nome, sobrenome, cargo, registro_conselho 
FROM colaborador 
WHERE matricula = 'MAT-001';

-- Update
UPDATE familia_de_origem 
SET renda_familiar_mensal = 1500.00 
WHERE id = 1;

-- Delete 
DELETE FROM atendimento 
WHERE numero_prontuario_acolhido = 'PRONT-2024-051' 
  AND matricula_colaborador = 'MAT-001' 
  AND data_realizacao = '2026-06-12' 
  AND horario_realizacao = '08:30';
