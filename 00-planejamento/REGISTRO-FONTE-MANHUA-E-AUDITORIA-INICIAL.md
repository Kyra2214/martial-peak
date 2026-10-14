# Registro da fonte do manhua e auditoria inicial

**Status:** fonte candidata identificada; leitura visual direta ainda não validada.  
**Data da verificação:** 2026-10-14.  
**Escopo desta entrega:** localizar uma edição identificável do manhua e registrar fatos verificáveis sem misturar numeração da novel e do manhua.

## 1. Fonte de referência do manhua

- **Obra:** *Martial Peak* / 武炼巅峰.
- **Plataforma identificada:** WebNovel.
- **Página do capítulo 1 do manhua:** https://www.webnovel.com/comic/martial-peak_14866013705882901/001_43314488371365883
- **Página-base da série:** https://www.webnovel.com/comic/martial-peak_14866013705882901/0
- **Identificador da série na URL:** `14866013705882901`.
- **Identificador exibido para o capítulo inicial:** `001`.
- **Estado de acesso nesta verificação:** o índice de busca localizou a página, mas o conteúdo visual retornou erro de carregamento/404 no extrator. Portanto, a existência da página é evidência de localização, não prova de que os quadros foram inspecionados.
- **Referência institucional sobre a adaptação:** Yuewen IP lista *Martial Peak* como obra de quadrinhos e resume o início de Yang Kai como discípulo de prova/varredor que encontra o Livro Negro sem palavras: https://www.yuewen.com/en/ipworks/detail?id=10

## 2. Hierarquia e limites das fontes

1. **Manhua escolhido, com quadros efetivamente visíveis:** fonte primária para numerar e adaptar cenas do jogo.
2. **Página institucional da adaptação:** confirma identidade geral da obra, autoria/créditos disponíveis e premissa; não substitui os quadros.
3. **Novel *武炼巅峰* de 莫默:** fonte auxiliar para esclarecer contexto e sequência, com numeração sempre registrada separadamente.
4. **Wikis, agregadores e índices:** pistas de localização apenas; não são prova final de um acontecimento quando não apontam para o quadro/capítulo primário.

Não copiar capítulos inteiros nem usar traduções de origem/licença não confirmada como se fossem oficiais.

## 3. Evidência inicial registrada

| ID | Fato / pista | Fonte e localização | Confiança | Uso permitido |
|---|---|---|---|---|
| SRC-001 | Existe uma página de série do manhua *Martial Peak* na WebNovel. | https://www.webnovel.com/comic/martial-peak_14866013705882901/0 | Alta para localização; não prova acesso aos quadros | Identificar a edição candidata |
| SRC-002 | O primeiro item localizado é apresentado como capítulo `001`. | https://www.webnovel.com/comic/martial-peak_14866013705882901/001_43314488371365883 | Alta para o rótulo exibido | Registrar o identificador como `001`, sem inferir correspondência com capítulo da novel |
| SRC-003 | A sinopse institucional descreve Yang Kai como discípulo de prova/varredor e a descoberta do Livro Negro como ponto de virada. | https://www.yuewen.com/en/ipworks/detail?id=10 | Alta para a premissa geral; não determina os quadros ou o número do capítulo | Orientar o mapa macro, nunca fechar uma cena específica |
| SRC-004 | A busca por uma página de capítulo não retornou quadros visíveis nesta verificação. | Resultado indexado da página WebNovel; erro de carregamento/404 | Alta quanto à limitação observada nesta sessão | Impede declarar auditoria visual concluída |

## 4. Matriz inicial de cenas — sem fechar mapeamentos pendentes

| Evento | Novel (número separado) | Manhua | Fato canônico a preservar | Adaptação permitida | Estado |
|---|---:|---|---|---|---|
| Yang Kai como discípulo de prova e varredor | Capítulo da novel ainda deve ser citado na ficha específica | Capítulo 1 é indicado por índices secundários; quadros não verificados nesta sessão | Começo humilde, dificuldade de cultivo e persistência de Yang Kai | Condensar rotina repetitiva; não inventar missão obrigatória | Parcial; conferir quadros |
| Descoberta do Livro Negro sem palavras | A novel tem capítulo 4 intitulado 黑书 (“Livro Negro”) no catálogo consultado | Número do manhua ainda não confirmado por inspeção direta | O Livro Negro é o ponto de virada | Tutorial opcional pode ensinar interação, sem mudar causa ou consequência | Parcial |
| Osso dourado / temperamento corporal | O catálogo da novel contém o capítulo 5 傲骨金身; outras fontes secundárias sugerem capítulos iniciais distintos para o manhua | Pendente | Preservar ordem, mecanismo e consequência da herança | Sistema de progressão só depois da cena ser confirmada | Pendente |
| Incensário | A novel tem capítulo 14 香炉 no catálogo consultado | Número do manhua não confirmado | Não substituir objeto, efeito ou contexto por suposição | Mecânica pode condensar uso repetitivo após confirmar a cena | Pendente |
| Xiao e pomada medicinal | Referência exata ainda não localizada visualmente | Pendente | Preservar a pomada; não trocar por pílula de cura inventada | Diálogo pode ser condensado sem alterar gesto, motivo ou consequência | Pendente |
| Vale do Dragão / Sun Yu / Lago da Fênix | Âncora de pesquisa na novel: capítulos 829–842, a confirmar cena por cena | Pendente | Preservar a sequência e o desfecho antes da primeira partida do Palácio Dragão-Fênix | Exploração opcional não pode alterar resultados fixos do cânone | Pendente |

## 5. Regra de numeração

Cada referência futura deve conter, em campos distintos:

- `novel_capitulo` e `novel_titulo`;
- `manhua_capitulo` e `manhua_titulo` (quando disponível);
- URL direta da cena/capítulo;
- `tipo_evidencia`: quadro visual, texto institucional, catálogo da novel, wiki/índice ou inferência;
- `status_verificacao`: confirmado visualmente, corroborado, pista ou pendente;
- fato canônico, compressão proposta e mecânica de jogo separadas.

É proibido preencher o número do manhua copiando o número da novel.

## 6. Critério de conclusão desta frente

Esta frente **não está concluída** enquanto os capítulos e quadros do manhua não puderem ser inspecionados diretamente de forma consistente. A página WebNovel fica registrada como edição candidata por ser uma fonte identificável da série, mas o acesso visual bloqueado precisa ser resolvido antes de fechar os mapeamentos. Se necessário, usar capturas/capítulos fornecidos pelo usuário como evidência primária, registrando edição e numeração mostrada.

## 7. Próximas ações objetivas

1. Conseguir acesso visual reproduzível à edição selecionada, sem alternar silenciosamente entre edições.
2. Confirmar visualmente os capítulos iniciais e registrar o mapeamento do Livro Negro, osso dourado, temperamento corporal, incensário e cena de Xiao/pomada.
3. Avançar cronologicamente até Vale do Dragão, Sun Yu, Lago da Fênix e primeira saída do Palácio Dragão-Fênix, mantendo uma linha por acontecimento importante.
4. Só então consolidar o roteiro jogável e corrigir os roteiros legados com referências rastreáveis.


## 8. Novas pistas cruzadas encontradas (ainda secundárias)

A pesquisa posterior encontrou um índice comunitário que apresenta correspondências explícitas entre capítulos da novel e do manhua para páginas do Livro Negro. Isso melhora a trilha de auditoria, mas **continua sendo evidência secundária** até comparar com os quadros da edição WebNovel escolhida.

| Elemento | Capítulo da novel indicado pelo índice | Capítulo do manhua indicado pelo índice | Fonte | Estado |
|---|---:|---:|---|---|
| Esqueleto Dourado Inquebrável | 6 | 8 | https://martial-peak-mp.fandom.com/wiki/Demon_Mystic_Tome | Pista secundária; verificar quadros |
| Registro de Temperamento Corporal / Corpo Dourado Orgulhoso | 7 | 9 | https://martial-peak-mp.fandom.com/wiki/Demon_Mystic_Tome | Pista secundária; verificar quadros |
| Incensário Antigo | 14 | 19 | https://martial-peak-mp.fandom.com/wiki/Demon_Mystic_Tome | Pista secundária; verificar quadros |
| Arte Secreta do Verdadeiro Yang | 32 | 29 | https://martial-peak-mp.fandom.com/wiki/Demon_Mystic_Tome | Pista secundária; verificar quadros |
| Primeira aparição de Sun Yu | 829 | 728 | https://martial-peak-mp.fandom.com/wiki/Sun_Yu | Pista secundária; verificar edição e capítulo |

### O que a fonte de novel acrescenta ao arco do Lago da Fênix

O capítulo 842 da novel, intitulado “Phoenix Lake”, descreve Yang Kai e Sun Yu no Lago da Fênix, a manifestação do dragão dourado e da Fênix de Gelo, a confirmação de que a herança da Fênix pertence a Su Yan e a despedida de Yang Kai de Sun Yu antes de partir. Referências para conferência de contexto: https://hhnovel.com/hhnovel/martial-peak/chapter-842 e https://www.divinedaolibrary.com/story/martial-peak/martial-peak-chapter-842-phoenix-lake/.

**Limite:** esses textos de novel não estabelecem por si só o capítulo do manhua, nem autorizam copiar diálogos ou prosa. Servem apenas como apoio de continuidade até a conferência visual.

### Implicações de continuidade

- Sun Yu é personagem masculino e amigo de Yang Kai; sua primeira aparição no manhua é indicada secundariamente como capítulo 728. Não confundir Sun Yu com Su Yan (a personagem associada à Fênix de Gelo) nem com Su Mu (irmão mais novo de Su Yan).
- A cena do Lago da Fênix é uma etapa de preparação da herança de Su Yan; não significa que Su Yan esteja fisicamente presente no lago durante essa cena da novel.
- O encerramento da temporada deve seguir o ponto aprovado: a primeira partida de Yang Kai do Palácio Dragão-Fênix depois do arco do Lago da Fênix, com o encadeamento exato conferido na edição do manhua escolhida.


## 9. Confirmação adicional do catálogo da edição escolhida

A consulta atual ao catálogo da WebNovel confirma que a edição identificada é *Martial Peak*, publisher Pikapi, e lista 1.621 capítulos no momento da consulta. O catálogo mostra capítulos numerados individualmente, incluindo 001–019 e outros capítulos posteriores. Fonte: https://www.webnovel.com/comic/14866013705882901/catalog.

Páginas de capítulos que foram localizadas por busca:
- Capítulo 9 (identificador 009): https://www.webnovel.com/comic/martial-peak_14866013705882901/009_43875919248552970
- Capítulo 29 (identificador 029): https://www.webnovel.com/comic/martial-peak_14866013705882901/029_46125337234424440
- Capítulo 728: https://www.webnovel.com/comic/martial-peak_14866013705882901/728_61107711902793922

O capítulo 728 é uma correspondência secundária relevante porque a wiki de Sun Yu indica a primeira aparição dele no manhua nesse número. A página da WebNovel localizada, porém, exige login e não expôs quadros na captura textual; a correspondência fica como **catálogo localizado + índice secundário**, não como leitura visual confirmada.

### Correção de precisão sobre capítulos da novel

Os títulos iniciais da novel e os números de capítulo podem variar conforme a edição/serialização consultada. Por isso, referências como “novel capítulo 5 — 傲骨金身” e “manhua capítulo 8 — Esqueleto Dourado” não devem ser fundidas numa equivalência direta. Para cada linha do cânone, registrar o número e título exatamente como exibidos na fonte específica e manter a numeração da novel separada da do manhua.

### Decisão operacional

A edição WebNovel/Pikapi passa a ser a **edição de referência escolhida para numeração** porque tem série e catálogo estáveis e capítulos individualizáveis. Isso não equivale a declarar que o conteúdo foi lido visualmente. Até que os quadros possam ser inspecionados, as fichas permanecem classificadas como “catálogo localizado”, “pista secundária” ou “pendente de verificação visual”.
