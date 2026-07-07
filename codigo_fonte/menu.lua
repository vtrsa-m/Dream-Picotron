--[[pod_format="raw",created="2025-09-17 16:01:09",modified="2025-09-18 22:48:37",revision=47]]
vid()
window{pauseable=false}
opcs={"continuar","novo jogo","sair"}
lim=((save_state or jogo_iniciado)and 1 or 2)
opc=lim

while true do
--background

cls(32)







--menu

	--local mx,my,mc=mouse() --//config mouse
	
	
	if (btnp(2) and opc>lim) opc-=1 
	if (btnp(3) and opc<3) opc+=1
	for i=lim,#opcs do
		if opc==i then c=10 else c=5 end
	 	print(opcs[i],20,60+((i-1)*10),c)
	end
	if btnp(6) or btnp(4) or keyp("space") then
		if(opc==1) flip=flip_novo break
		if opc==2 then 
			if not jogo_iniciado then
				break		
			else
				flip=flip_novo set_draw_target(main_screen) include "game.lua"
			end
		end
		if opc==3 then 
			vid(1)
			set_draw_target()
			local fade=0
			while fade<135 do
			 	fade+=(136-fade)*0.1
			 	rectfill(0,0,480,fade,36)
			 	rectfill(0,270,480,270-fade,36)
			 	flip()
			end
			exit()
		end
	end
flip()
end