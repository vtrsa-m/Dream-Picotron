# 🌲 Dream (Text Adventure)

Um joguinho de exploração textual e manipulação de árvores de dados feito no [Picotron](https://www.lexaloffle.com/picotron.php)!

**Disciplina:** Estrutura de Dados 2  
**Curso:** Engenharia da Computação - IFMS  
**Equipe:** Vitor Silva Amâncio, Pablo Felipe e Bruno Brito

---

## 🎮 O que é?

O Dream é uma engine de aventura em texto onde absolutamente tudo no mundo (você, as salas, os itens) é um nó numa **Árvore N-ária**. A ideia é que você joga digitando comandos, e esses comandos navegam, criam ou modificam a árvore do jogo em tempo real.

## 🕹️ Como Jogar / Testar

A gente preparou uns scripts para facilitar na hora de rodar o jogo e evitar qualquer problema com o ambiente gráfico. É só baixar o repositório e escolher o seu sistema:

**Se você usa Linux:**
Abra o terminal na pasta do projeto, dê permissão de execução (`chmod +x *.sh`) e rode um dos scripts:
* `./setup_web.sh` -> Abre o jogo no seu navegador (Opção mais segura)
* `./setup_linux.sh` -> Abre o executável nativo do Picotron

**Se você usa Windows:**
Basta dar dois cliques em um destes arquivos:
* `setup_web.bat` -> Abre no navegador
* `setup_windows.bat` -> Abre o executável nativo

---

## ⌨️ Comandos Básicos

No terminal do jogo, você digita o que quer fazer. Dá até pra encadear comandos separando por vírgula. Alguns dos principais são:

* `criar <artigo> <nome>`: Cria um novo item na sala (ex: `criar uma espada`).
* `entrar em <lugar>` e `sair`: Navega pelos nós da árvore.
* `me tornar <nome>`: Assume o controle de um objeto da sala (você ganha um corpo e um inventário).
* `pegar <objeto>` e `soltar <objeto>`: Move itens entre o seu inventário e a sala atual.
* `programar <objeto> para ( <comandos> )`: Grava uma rotina num objeto.
* `usar <objeto>`: Executa a rotina gravada naquele objeto.
* `ajuda`: Mostra a lista completa de comandos lá dentro.

---

## 🧠 Como funciona por baixo dos panos

Se você for olhar o código (no cartucho `.p64` ou nos arquivos `.lua`), o núcleo estrutural do jogo é a tabela `vessel` (nossos nós). 

Cada vessel guarda ponteiros para o seu `pai` e uma lista encadeada de `filhos`. O estado do jogador é definido por dois ponteiros soltos: o `local_atual` e a `identidade`. 
Quando você digita um comando como "pegar", o motor de jogo está fazendo puramente operações clássicas de árvores: buscando um nó, removendo-o da lista de filhos do `local_atual` e inserindo na lista de filhos da `identidade`.