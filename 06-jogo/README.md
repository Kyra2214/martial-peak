# Protótipo jogável — Godot 4.3

Engine decidida em 2026-10-14: **Godot 4** (GDScript, renderer Compatibility, bom para web e celular).

## Como rodar
1. Instale o Godot 4.3 ou superior.
2. Abra a pasta `06-jogo/` como projeto (Import) e aperte F5.
3. Controles: WASD ou setas para andar, E/Espaço/Enter para interagir e avançar diálogo. Os botões touch ficam visíveis na tela e funcionam no celular, tablet e navegador com toque.

## O que já existe (vertical slice do Cap. de jogo 01, provisório)
- Pátio do Pavilhão (placeholder gráfico), movimento e interação.
- Diálogos em `data/dialogos/cap01.json` (texto provisório do legado).
- Varrer 3 pilhas (+1 ponto), duelo ATB contra o Discípulo A, derrota sob a árvore, pomada de cura, menu de Itens, XP e nível.
- Dados lidos dos CSVs em `data/` (copiados de `05-dados/`).

## Estrutura
- `scripts/data_db.gd` carrega CSV e diálogos. `game_state.gd` guarda estado. `dialogue.gd` caixa de diálogo.
- `scripts/world_patio.gd`, `player.gd`, `interactable.gd`, `block.gd` mapa e movimento.
- `scripts/battle.gd` combate ATB no modo wait. `hud.gd` HUD e itens. `main.gd` fluxo do capítulo.

## Testes (rodam sem janela)
```
godot --headless --path 06-jogo -s tests/smoke.gd
godot --headless --path 06-jogo -s tests/flow.gd
```
Validado com Godot 4.3: smoke com 0 falhas e o capítulo inteiro simulado sem erros.

## Regras de manutenção
- Os CSVs de `05-dados/` são a fonte; ao mudar, copie para `06-jogo/data/`.
- Tudo que é número é [J]/[AJUSTAR]; cenas e NPCs seguem [P] até a conferência no manhua.
- Os gráficos são retângulos de teste, sem assets finais.

## Próximos passos
1. Você jogar e dar feedback de ritmo e combate.
2. Cena do Livro Negro (2ª página, caldeirão) e treino noturno.
3. Salvar/carregar e menu de técnicas fora de combate.
4. Exportar para Android/Web.
