# Fase 0 — Auditoria e consolidação do projeto

**Projeto:** Martial Peak RPG  
**Data da auditoria:** 2026-10-14  
**Branch auditada:** `main`  
**Commit-base auditado:** `f38b9d350af83dc817c0fe7e027ed368c68207b0`  
**Escopo aprovado:** Temporada 1, de acordo com a cronologia canônica de Yang Kai, até sua saída do Templo Fênix Dragão.  
**Decisões do usuário:** fidelidade rigorosa ao cânone; conteúdo jogável expandido apenas com atividades originais coerentes; Yang Kai é o protagonista e segue a história original.  
**Limite desta fase:** planejamento e documentação. Engine, código, arte final e implementação não fazem parte desta fase.

## 1. Resultado executivo

O repositório está em **pré-produção narrativa e de sistemas**, não em implementação. Há material útil para reaproveitar, mas ele não está pronto para servir de roteiro canônico fechado.

- Foram encontrados **25 arquivos**: 18 documentos Markdown contando README e pendências, e 5 CSVs de dados, mais os documentos de roteiro/sistemas/personagens/mundo; nenhum código de jogo, projeto de engine, assets de jogo ou testes automatizados foi encontrado.
- Há **6 capítulos com diálogos detalhados** (capítulos 1–6), um resumo de capítulos 2–8, visão geral, documentos de sistemas, personagens, mapa e tabelas CSV.
- Os capítulos 7 e 8 existem apenas em resumo. O final atualmente planejado é a caverna/dimensão de herança e a transição para um arco seguinte; **não cobre ainda, de forma documentada, toda a trajetória até a saída do Templo Fênix Dragão**.
- O material mistura fatos declarados como canônicos, informações relatadas pelo usuário, hipóteses marcadas `[VERIFICAR]` e mecânicas originais. Essa distinção precisa ser formalizada antes de aprovar o roteiro.
- Há contradições internas e números ainda não validados. Não é seguro começar a implementação antes de resolver a cronologia, o limite da temporada e a contabilidade de progressão.

Esta auditoria não declara que os eventos duvidosos estão errados no manhwa; declara que **os arquivos atuais não trazem evidência suficiente para tratá-los como cânone confirmado**.

## 2. Inventário verificado

| Área | Conteúdo encontrado | Estado |
|---|---|---|
| Roteiro | Visão geral; capítulos 1–6 com diálogos; resumo dos capítulos 2–8 | Parcial |
| Sistemas | Combate ATB, domínios, pílulas, pontos, puzzle de refinamento, rompimento/quests | Propostas iniciais; sem testes |
| Personagens | Yang Kai, NPCs e inimigos | Parcial; vários nomes/eventos pendentes |
| Mundo | Lista textual de quatro mapas | Conceitual; não são mapas jogáveis |
| Dados | 5 CSVs de atributos, inimigos, pílulas, pontos e técnicas | Esboços de balanceamento |
| Implementação | Código, projeto de engine, assets e testes | Não encontrados na árvore auditada |
| Gestão | README e PENDENCIAS | Precisavam alinhar-se às decisões atuais |

## 3. Achados prioritários

### P0 — Bloqueiam a aprovação do plano narrativo

1. **Limite incorreto/incompleto da temporada.** O material existente termina no topo da herança e aponta para um arco seguinte. A decisão atual é seguir até a saída do Templo Fênix Dragão. É necessário refazer o mapa macro da história com esse marco final, sem presumir que o antigo “Arco 1” do repositório equivale à Temporada 1.
2. **Cânone não rastreável.** Os documentos usam expressões como “confirmado pelas fontes”, “confirmado pelo usuário” e `[VERIFICAR]`, mas não há registro de capítulo/página/cena do manhwa que sustente cada afirmação. A Fase 1 deverá criar uma matriz de evidências e marcar o que é cânone, relato do usuário, adaptação ou conteúdo original.
3. **Eventos originais tratados como parte do fluxo principal.** O roteiro inclui rotina de tarefas, diálogos extensos, NPCs originais, coleta, mini-chefe, treino por foco e duelo com derrota obrigatória. Podem ser atividades secundárias, mas precisam ser posicionadas sem mudar, substituir ou contradizer os eventos canônicos.
4. **Capítulos 7–8 insuficientes.** Há apenas resumos, sem cenas, transições ou diálogos completos; além disso, o encerramento da temporada precisa avançar até a saída do Templo Fênix Dragão.

### P1 — Inconsistências documentais e de progressão

5. **Documento obsoleto sobre o puzzle e a pílula de teste.** `capitulos-02-a-08-resumo.md` ainda menciona pílula de teste e puzzle tutorial no capítulo 4. `PENDENCIAS.md` diz que foram removidos do Arco 1; `capitulo-04-dialogos.md` também os chama de design próprio. A versão antiga do resumo não deve orientar o roteiro.
6. **Contagem de capítulos e duração não fecha.** A visão geral estima 1–2 horas, mas as durações declaradas nos capítulos 1–6 somam aproximadamente 115–150 minutos, antes dos capítulos 7–8 e sem contabilizar exploração opcional.
7. **Cronologia interna pouco consistente.** O capítulo 2 avança cinco dias; o capítulo 6 menciona três meses de treino, enquanto os contadores de prazo indicam passagens específicas de dias. Falta uma linha do tempo única com datas/duração entre eventos.
8. **Pontos e economia sem livro-caixa.** O capítulo 3 concede 20 pontos; o capítulo 5 começa com 12 e termina com 67. A matemática final do capítulo 5 fecha (12 + 40 + 15 = 67), mas a origem do saldo inicial e os gastos anteriores não estão documentados. O preço de 50 pontos para cura pode tornar o jogador incapaz de comprar a pílula sem uma fonte clara de renda.
9. **Recompensas e níveis possivelmente duplicados ou ambíguos.** O capítulo 5 diz que a vitória concede Punho Concentrado no nível 7 e XP até o nível 7, embora o arco de progressão também dependa de monstros/duelos; o método exato para alcançar cada nível precisa ser calculado.
10. **Atributos e técnicas não testados.** O salto do nível 4 para 5 é grande; multiplicadores, custo de Qi, efeitos de defesa/esquiva e chefe não foram validados por simulação nem playtest.
11. **Sistemas não harmonizados.** O documento de pílulas descreve várias categorias e efeitos, mas o roteiro diz que a Cura é a única disponível nessa parte da história. CSVs incluem pílulas que não deveriam estar disponíveis ainda.
12. **Regra de rompimento e domínio precisa de evidência canônica.** O modelo genérico de nível 9, chance percentual, falha com “Meridianos Feridos” e quest de classe é design de jogo até que seja confirmado; não deve ser apresentado como regra do manhwa.
13. **Mapa ainda é lista de áreas.** Não há escala, conexões, pontos de entrada/saída, bloqueios, rotas ou critério de desbloqueio completo para as áreas.

### P2 — Qualidade e organização

14. **Nomes provisórios espalhados por vários arquivos.** Discípulos A–E, Irmã Xiao, responsável, instrutor, velho do pavilhão, ervas, mini-chefe e chefe final precisam de uma fonte única de verdade.
15. **Terminologia de cultivo e tradução sem glossário.** Os nomes dos reinos, técnicas e locais precisam de grafia padronizada e verificação antes de alimentar diálogos/CSV.
16. **Status de conteúdo inconsistente.** “Confirmado”, “baseado na herança”, “design próprio” e `[VERIFICAR]` não seguem um esquema uniforme.
17. **Ordem de implementação antiga no README.** O texto recomendava começar a codar e decidir entre Godot/RPG Maker; isso não corresponde à decisão atual de concluir o plano primeiro.

## 4. Decisões consolidadas do projeto

Estas decisões são o contrato de planejamento desta temporada:

- **Protagonista:** Yang Kai, seguindo a cronologia original.
- **Fidelidade:** rigorosa. Não alterar acontecimentos canônicos nem criar divergências silenciosas.
- **Conteúdo adicional:** exploração, treinamento, tarefas e missões originais são permitidos como conteúdo expandido, desde que identificados como originais e compatíveis com o cânone. Não podem substituir eventos essenciais nem mudar seus resultados.
- **Marco final:** saída de Yang Kai do Templo Fênix Dragão.
- **Engine e tecnologia:** adiadas; não são decisões desta fase.
- **Regra de evidência:** nenhuma informação duvidosa será rotulada como canônica sem referência rastreável. Na ausência de evidência, permanece pendente.
- **Regra de conclusão:** fase só é concluída com artefatos revisáveis, verificações realizadas e pendências explicitadas; marcar uma caixa sem evidência não conta como conclusão.

## 5. Plano de correção após a auditoria

1. **Fase 1 — Bíblia do cânone:** montar cronologia do começo até a saída do Templo Fênix Dragão; registrar personagem, local, reino, técnica e evento com referência à fonte; separar cânone, informação relatada, adaptação e conteúdo original.
2. **Fase 2 — Design global do RPG:** revisar combate, cultivo, economia, missões, inventário, pílulas, progressão e falha; definir quais mecânicas existem em cada trecho da cronologia.
3. **Fase 3 — Mapa narrativo da Temporada 1:** dividir a cronologia validada em arcos/capítulos jogáveis, com entradas, saídas e transições até o marco final.
4. **Fase 4 — Roteiro detalhado:** revisar os capítulos 1–6 contra a bíblia; escrever capítulos e sequências faltantes; distinguir cenas canônicas de conteúdo original.
5. **Fase 5 — Validação de pré-produção:** conferir cronologia, continuidade, economia, fórmulas e cobertura do escopo. A implementação só será planejada depois desta aprovação.

## 6. Critérios de aceite da Fase 0

- [x] Árvore do repositório e todos os 25 arquivos listados foram inspecionados.
- [x] README, visão geral, roteiro existente, sistemas, personagens, mapas, CSVs e pendências foram confrontados entre si.
- [x] Contradições, lacunas e riscos foram registrados neste relatório.
- [x] As decisões do usuário para a Temporada 1 foram consolidadas.
- [x] A orientação de “codificar primeiro” e a decisão de engine foram retiradas da orientação principal do projeto.
- [x] O escopo foi corrigido para apontar até a saída do Templo Fênix Dragão, sem declarar a cronologia canônica validada prematuramente.
- [x] Nenhum código ou mecânica foi implementado nesta fase.
- [x] As pendências restantes foram organizadas para a Fase 1.

## 7. Evidências e limites

- Árvore recursiva da branch `main` no commit-base `f38b9d350af83dc817c0fe7e027ed368c68207b0`: [ver árvore auditada no GitHub](https://api.github.com/repos/Kyra2214/martial-peak/git/trees/f38b9d350af83dc817c0fe7e027ed368c68207b0?recursive=1).
- [README auditado](https://github.com/Kyra2214/martial-peak/blob/main/README.md)
- [Visão geral do roteiro](https://github.com/Kyra2214/martial-peak/blob/main/01-roteiro/00-visao-geral.md)
- [Resumo dos capítulos 2–8](https://github.com/Kyra2214/martial-peak/blob/main/01-roteiro/capitulos-02-a-08-resumo.md)
- [Sistemas de rompimento e quests](https://github.com/Kyra2214/martial-peak/blob/main/02-sistemas/rompimento-e-quests.md)
- [Pendências anteriores](https://github.com/Kyra2214/martial-peak/blob/main/PENDENCIAS.md)

**Limite da evidência:** esta é uma auditoria documental do conteúdo existente no repositório. Não é uma validação externa de cada evento do manhwa, nem um teste de jogo. A validação do cânone é trabalho explícito da Fase 1.
