# Fase 2 — Design global do RPG (sem escolha de engine)

**Objetivo:** definir regras de experiência jogável sem codificar nem assumir uma tecnologia. Este documento é uma especificação de design; números ainda não testados são hipóteses e não podem ser confundidos com cânone.

## 1. Pilares

1. **Cânone primeiro:** o jogador controla Yang Kai, e os acontecimentos centrais mantêm a ordem e os resultados da obra.
2. **Progressão por experiência e decisão:** o crescimento deve vir de combate, exploração, treinamento e missões, sem exigir repetição artificial em toda etapa.
3. **Conteúdo extra controlado:** missões originais podem preencher intervalos, mas precisam de rótulo, localização temporal e revisão de compatibilidade.
4. **Poder contextual:** inimigos, técnicas, itens e aliados disponíveis dependem do ponto da história. Não importar habilidades de arcos futuros.
5. **RPG de aventura:** exploração, conversas, missões, recompensas e encontros devem complementar o combate, não transformar cada acontecimento em uma batalha.
6. **Sem bifurcações canônicas:** escolhas de diálogo podem alterar tom, informação opcional ou recompensa lateral, mas não mudam decisões e resultados centrais do manhua.

## 2. Loop de jogo

1. Receber contexto narrativo e objetivo.
2. Explorar a área autorizada, conversar e examinar pontos de interesse.
3. Escolher atividades secundárias compatíveis com a cronologia.
4. Enfrentar encontros ou resolver desafios, quando previstos.
5. Receber experiência, recursos ou informação.
6. Treinar, organizar itens e preparar a próxima etapa.
7. Acionar o evento canônico no local e estado exigidos.
8. Registrar progresso e abrir a próxima parte da história.

O loop não deve obrigar o jogador a cumprir todas as tarefas opcionais para ver a história. Atividades opcionais podem melhorar a preparação, mas não devem alterar o resultado canônico.

## 3. Estrutura narrativa e desbloqueio

- A campanha é dividida em **temporadas → arcos → capítulos → cenas**.
- Cada capítulo declara: pré-requisitos, local inicial/final, cenas canônicas, conteúdo original, personagens presentes, encontros, itens e estado final.
- As cenas canônicas usam bloqueios narrativos: não se pode adiantar uma herança, visitar um local antes da hora ou concluir um confronto-chave antes da cena prevista.
- A exploração opcional fica disponível apenas quando a cronologia permitir.
- Não haverá escolha de “final alternativo” na campanha principal.
- Conteúdo original terá identificador O-### e campo de compatibilidade canônica; evento canônico terá identificador C-### e referência à bíblia.
- Uma cena sem referência suficiente permanece PENDENTE; não entra como cena canônica pronta.

## 4. Combate

### Modelo conceitual

O projeto atual propõe combate por turnos com barra de ação (ATB). O modelo pode ser mantido como direção provisória, mas sua velocidade e regras exatas serão validadas em protótipo futuro.

Ações-base:
- **Ataque básico**
- **Técnica** — apenas técnicas já aprendidas na cronologia
- **Item** — apenas itens realmente disponíveis naquele trecho
- **Defender/esquivar**, quando coerente com as capacidades do personagem
- **Fugir**, quando o encontro não for um confronto canônico obrigatório
- **Ação contextual**, apenas para eventos especiais justificados pela cena

### Regras de fidelidade

- Não fazer o jogador vencer um personagem que Yang Kai perde na obra, nem forçar derrota em um combate que a obra mostra como vitória decisiva, sem um mecanismo de jogabilidade que não reescreva a história.
- Em encontro canônico de resultado fixo, o combate pode ser ajustado em dificuldade, fases e objetivos, mas o resultado da narrativa não muda.
- Se o jogador perde um encontro que precisa ser vencido para a história continuar, usar reinício do encontro, retorno ao checkpoint ou ajuste de preparação; não escrever uma morte ou consequência alternativa.
- Para duelos em que a derrota é canônica, encerrar a luta na condição apropriada, sem permitir que a vitória do jogador crie uma divergência.
- Chefes e fases extras só podem ser apresentados como conteúdo original, não como chefes canônicos sem referência.
- O dano, as fórmulas, o ATB e a dificuldade são parâmetros de jogo, não fatos do manhua.

### Balanceamento

O documento de combate existente contém uma fórmula preliminar. Ela não está aprovada para produção. Antes de fixar números, precisamos de:
- simulações de lutas curtas e longas;
- média de turnos por encontro;
- consumo e recuperação de Qi;
- análise de dano mínimo/máximo e possibilidade de bloqueio;
- testes contra inimigos comuns, elites e chefes;
- validação de que a progressão não exige grind excessivo.

## 5. Cultivo e progressão

- A bíblia canônica determina a nomenclatura, ordem e condições dos reinos.
- A camada/estágio de Yang Kai deve refletir o ponto da história, e não um nível de RPG arbitrário.
- O nível de jogo pode existir como valor auxiliar, mas não deve substituir o reino canônico nem criar a impressão de que “nível 10 = Fundamento Inicial” é uma regra da obra se a fonte não confirmar isso.
- Cada salto narrativo importante deve ser associado a um marco canônico: treino, técnica, tesouro, herança, combate ou compreensão.
- XP, HP, Qi, ATK, DEF, velocidade e esquiva são parâmetros de balanceamento.
- Não permitir que o jogador compre uma técnica que Yang Kai ainda não conhece na cronologia.
- O treino manual só aparece quando é uma atividade plausível naquele trecho; qualquer treino automático ou bônus passivo deve ser tratado como regra de design e testado.
- Rompimento com chance percentual, punição genérica e “Meridianos Feridos” são propostas de sistema, não regras canônicas confirmadas.

## 6. Técnicas e habilidades

Cada técnica deve ter:
- nome padronizado;
- referência de origem;
- primeira aparição/aprendizado;
- condição de desbloqueio;
- custo e efeito no jogo;
- categoria CANON, ADAPTACAO ou ORIGINAL;
- restrições por capítulo.

Regras:
- Não atribuir nome inventado a uma técnica da obra.
- Não dar a Yang Kai técnicas de personagens diferentes sem justificativa narrativa explícita.
- Técnicas genéricas de jogo podem existir, mas precisam ser marcadas como adaptação.
- Uma habilidade “Limit Break” pode ser uma convenção do RPG, mas seu nome, efeito e momento de ativação devem ser separados da herança canônica que a inspira.
- O CSV atual não é fonte de verdade até ser revisado pela bíblia.

## 7. Itens, pílulas, equipamentos e recursos

### Disponibilidade

Todo item tem uma primeira aparição ou uma justificativa de design. O sistema deve impedir:
- comprar ou fabricar itens de grau indisponível;
- usar pílulas que Yang Kai não encontrou ou não tem acesso para adquirir;
- receber recompensas antes do evento canônico que as concede;
- obter itens de arcos futuros durante a Temporada 1 sem base narrativa.

### Pílulas e alquimia

- Graus, nomes, efeitos e regras de refinamento devem seguir a fonte quando a obra os especificar.
- Percentuais de cura, buffs de ATK/DEF, preços, pontos de contribuição e penalidades de sobrecarga são regras de jogo.
- O puzzle de refinamento não está aprovado como conteúdo da Temporada 1; só será incluído se a bíblia e o roteiro o justificarem, e mesmo assim como adaptação de jogo.
- Receitas, minijogos e recompensas originais devem ser rotulados ORIGINAL.

### Economia

- Separar moedas, pontos de contribuição e materiais de cultivo. Não presumir que sejam intercambiáveis.
- Pontos de contribuição só existem quando a organização e o trecho da história permitem esse sistema.
- Missões essenciais nunca podem ficar bloqueadas por saldo insuficiente.
- Os valores atuais de 1/3/5/8/15 pontos e o preço de 50 pontos por pílula são propostas, não cânone.
- Toda recompensa e gasto deve ser rastreável no capítulo, com saldo inicial e final reproduzível.

## 8. Missões, exploração e conteúdo opcional

Tipos:
- **Principal canônica:** conduz a um evento da obra; exige referência.
- **Secundária de personagem:** aprofunda personagem, sem alterar seu destino canônico.
- **Exploração:** revela geografia, materiais ou informação compatível.
- **Treinamento:** permite preparar Yang Kai sem criar saltos temporais inconsistentes.
- **Original de mundo:** conteúdo novo que não contradiz o cânone e é identificado como original.

Cada missão deve registrar:
- identificador e tipo;
- capítulo e janela temporal;
- local de início e fim;
- personagem que oferece/participa;
- objetivo e condição de conclusão;
- recompensa e origem da recompensa;
- impacto no estado do mundo;
- dependências;
- prova de compatibilidade canônica.

Atividades opcionais não podem alterar relações essenciais, sobrevivência, heranças, vencedores, prazos ou destinos canônicos. Se uma atividade exigir a presença de personagem ausente, deve ser movida ou removida.

## 9. Exploração e mapas

- Mapas representam locais canônicos e conexões justificadas, não um mundo aberto sem limites.
- Cada área tem entradas/saídas, bloqueios, pontos de interesse, encontros e condições de acesso.
- A transição entre áreas respeita o tempo e a localização da história.
- Recolha de ervas, baús, materiais e inimigos repetíveis podem ser conteúdo original, desde que não substituam eventos ou alterem a disponibilidade de recursos canônicos.
- Não criar mapa da floresta, caverna ou templo como se fosse geografia canônica antes de confirmar o local na obra.
- A lista atual de quatro mapas é somente uma proposta inicial e precisa ser refeita para cobrir o escopo aprovado.

## 10. Personagens, relações e aliados

- Yang Kai é controlável na campanha principal.
- Aliados controláveis só entram em combate quando a cronologia e a cena justificam a presença deles.
- Su Yan não pode ser tratada como companheira permanente por conveniência de jogo; a disponibilidade depende do que acontece no manhua.
- Relações, falas e reações precisam ser coerentes com o ponto da história.
- Diálogos originais podem expandir uma interação, mas não podem inventar revelações, mudar motivações centrais ou antecipar informações futuras.
- NPCs originais são permitidos em missões secundárias, identificados como originais e sem usurpar o papel de personagens canônicos.

## 11. Derrota, salvamento e acessibilidade

- A derrota em combate é um estado de jogo, não automaticamente um evento da história.
- Usar checkpoints e repetição de encontro para preservar o cânone.
- Não penalizar com morte permanente de personagem canônico.
- Opções de acessibilidade podem ajustar velocidade, leitura, assistência em combate e dificuldade sem mudar o resultado narrativo.
- A dificuldade não deve depender de reflexos extremos em uma história centrada em cultivo e combate estratégico.

## 12. Continuidade e dados

Cada capítulo precisa definir um estado de entrada e um estado de saída:
- reino/estágio e técnicas conhecidas por Yang Kai;
- itens e recursos;
- localização;
- personagens vivos/presentes/conhecidos;
- eventos canônicos já ocorridos;
- missões abertas/fechadas;
- fatos que o jogador e Yang Kai já sabem.

O estado final de um capítulo deve ser compatível com o estado inicial do próximo. CSVs só são atualizados depois que a bíblia e as regras forem aprovadas.

## 13. Critérios de aceite da Fase 2

- [x] Pilares e regras gerais de fidelidade definidos.
- [x] Loop principal de jogo definido.
- [x] Regras de combate, progressão, técnicas, itens, economia, missões, exploração, personagens, derrota e continuidade documentadas.
- [x] Propostas antigas separadas de cânone.
- [x] Nenhuma engine ou tecnologia escolhida.
- [ ] Fórmulas numéricas e balanceamento: ficam pendentes para protótipo e testes, não bloqueiam o design conceitual.
- [ ] Valores de todos os itens e técnicas: serão fechados após a cronologia detalhada.

**Critério de pronto:** qualquer futura mecânica pode ser avaliada contra este documento e a bíblia. Se conflitar com o cânone, a mecânica é que deve ser alterada.
