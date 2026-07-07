--[[pod_format="raw",created="2025-09-10 22:07:12",modified="2026-07-07 14:35:24",revision=101]]
::inicio::
cls(32)

foto(1)
nome ("Robertinho")
falar ([[oi]],3,true)
tremer()
esperar(10)
::game::

adicionar([[, tudo bem com voce??]],1)

resposta=escolher_2("opcao1","opcao2","opcao3","opcao4")

falar("voce escolheu a "..resposta)

resposta=escolher_1("amet?","dolor sit!!")



if(resposta=="amet?") falar("kkkkkkkkkkkkkkkkkkkkkkkk",1)
if(resposta=="dolor sit!!") falar("vitae pellentesque")

falar "eae beleza?"

resposta=escolher_2("sim", "na\vq~o")

if(resposta=="sim") falar "que bom"
if(resposta=="na\vq~o") falar "enta\vq~o se fode"


goto inicio

error("na\vq~o existe mais jogo")
