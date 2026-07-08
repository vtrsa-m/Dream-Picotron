# Dream: Engine de Aventura Textual em Árvore

**Disciplina:** Estrutura de Dados 2  
**Instituição:** Instituto Federal de Mato Grosso do Sul (IFMS)  
**Curso:** Engenharia da Computação (4º Semestre)  

**Equipe:**
* Vitor Silva Amâncio
* Pablo Felipe
* Bruno Brito

---

## 📌 Sobre o Projeto

O "Dream" é uma engine de Text Adventure desenvolvida no Picotron utilizando a linguagem Lua. O núcleo do sistema é fundamentado na manipulação de uma estrutura de **Árvore N-ária**, onde absolutamente tudo no jogo (salas, itens, personagens e o próprio jogador) é representado como um nó estrutural chamado de `vessel`.

O diferencial do projeto é que o interpretador de comandos permite que o jogador modifique a própria árvore de execução em tempo real, criando mundos, programando comportamentos e navegando entre os nós.

---

## ⚙️ Como o Código Funciona (Arquitetura)

O código-fonte foi modularizado para separar a lógica de dados, o motor de renderização e o interpretador de comandos. 

### 1. A Estrutura de Nós (`vessel`)
Cada elemento do mundo é gerado pela função `criar_vessel()`. Em memória, um `vessel` é uma tabela Lua que funciona como um nó da árvore, contendo:
* **Ponteiros de Hierarquia:** `pai` (nó superior) e `filhos` (lista de nós internos).
* **Propriedades Base:** `nome`, `artigo` e `descricao`.
* **Metaprogramação:** `programa` (uma string contendo comandos que o próprio interpretador pode executar recursivamente), `gatilhos` e `bloqueios`.

### 2. Ponteiros Globais de Navegação
O estado do jogo é controlado por dois ponteiros principais que percorrem a árvore:
* **`local_atual`:** Aponta para o nó onde a ação está ocorrendo. Inicia no nó raiz ("Lugar Nenhum"). O comando `entrar` desce na árvore (acessa um filho), enquanto `sair` sobe na árvore (acessa o pai).
* **`identidade`:** Aponta para o nó que o jogador está "possuindo". Se for nulo, o jogador é um observador sem corpo. Assumir uma identidade permite manipular o inventário (mover nós dos filhos do `local_atual` para os filhos da `identidade`).

### 3. Tratamento de Erros e Renderização
* **`exibir.lua`:** Lê dinamicamente o `local_atual` e a `identidade` para renderizar a interface gráfica puramente baseada no estado dos nós.
* **`error.lua`:** Um sistema de segurança robusto utilizando `pcall`. Caso o interpretador encontre um erro fatal de execução, o jogo não quebra; ele exibe uma tela de erro personalizada e mantém a aplicação rodando.

---

## 🎮 Guia de Comandos (Como Usar)

O programa aceita entradas de texto natural interpretadas sequencialmente. Você pode encadear comandos separando-os por vírgula. Abaixo está a lista de comandos suportados:

### Criação e Manipulação do Mundo
* `criar <artigo> <nome>`: Instancia um novo nó (vessel) dentro do local atual.
  * *Exemplo:* `criar uma espada`, `criar um fantasma`, `criar a porta`.
* `descrever <objeto> como <descrição>`: Adiciona texto descritivo a um objeto presente no local ou ao próprio local atual.
  * *Exemplo:* `descrever porta como de madeira escura`.

### Movimentação (Navegação na Árvore)
* `entrar em <local>`: Move sua visão para dentro de um objeto/sala.
  * *Exemplo:* `entrar em casa`.
* `sair`: Volta para o objeto pai do local atual.

### Identidade e Inventário (Manipulação de Nós)
* `me tornar <nome>`: Transfere o controle do jogador para um vessel existente no local, permitindo carregar itens.
  * *Exemplo:* `me tornar fantasma`.
* `pegar <objeto>`: Move um vessel do local atual para a sua identidade (inventário). Requer estar possuindo um corpo.
* `soltar <objeto>`: Move um vessel da sua identidade de volta para o local atual.

### Programação In-Game
O sistema permite injetar comandos dentro dos objetos para que eles reajam.
* `programar <objeto> para ( <comandos> )`: Armazena uma rotina no objeto. Os parênteses são obrigatórios para agrupar o bloco de código.
  * *Exemplo:* `programar cafeteira para ( criar um cafe, exibir cafe quentinho, pegar cafe )`
* `usar <objeto>`: Executa a rotina gravada no objeto, repassando os comandos internos de volta ao interpretador.

### Sistema
* `exibir <texto>`: Imprime uma mensagem de sistema na tela.
* `ajuda`: Lista todos os comandos.
* `ajuda <comando>`: Explica detalhadamente o funcionamento de um comando específico.

---

## 🚀 Instruções de Execução

Foram disponibilizados scripts de inicialização automática. Escolha a versão mais adequada para o seu ambiente:

1. Dê permissão de execução aos scripts: `chmod +x setup_web.sh setup_linux.sh`
2. **Para jogar no Navegador (Recomendado):** Execute `./setup_web.sh`. O script irá levantar um servidor local seguro e abrir a interface web no seu navegador padrão.
3. **Para jogar via Binário Nativo:** Execute `./setup_linux.sh`. O script irá carregar o executável nativo do Picotron com as configurações otimizadas de janela (Wayland/X11).

---