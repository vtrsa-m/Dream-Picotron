--[[pod_format="raw",created="2025-09-10 21:58:45",modified="2025-09-18 22:47:28",revision=748]]
flip_original=flip
clear=cls
cores={32,24,35}

function flip_novo()
	set_draw_target()
	if(keyp("backspace") or keyp("escape") or (botao_start and not keyp("enter"))) pause_menu()
	botao_start=btnp(6)
	spr(main_screen,0,0)
	spr(overlay)
	if	save_time and (t()-save_time)<2.5 then
		icon_save()
	end
	flip_original()
	set_draw_target(main_screen)
end
flip=flip_novo


function historico()
	local screen=print_screen()
	local x=0
	local y=230-(qnt_char(historico_text,"\n")*11)
	local borda=userdata("u8",480,270)
	flip_original()
	set_draw_target(borda)
	cls(cores[1])
	rrectfill(10,10,460,250,9,0)
	rrect(10,10,460,250,9,cores[3])
	set_draw_target(historico_screen)
	cls(cores[1])
	print(historico_text,20,y,cores[3])
	spr(borda)
	set_draw_target()
	while x<480 do
		x+=(480-x)*(10/100)
		if x<480 then x+=0.1 end
		if x>480 then x=480 end
		cls()
		spr(historico_screen,480-x)
		spr(screen,x)
		flip_original()
	end
	while not (keyp("escape") or keyp("h") or btnp(5) or btnp(6)) do
		if btn(3) then y-=2 end
		if btn(2) then y+=2 end
		cls(cores[1])
		print(historico_text,20,y,cores[3])
		spr(borda)
		flip_original() 
	end
	while x>0 do
		x+=-x*(10/100)
		if x>0 then x-=0.1 end
		if x<0 then x=0 end
		cls()
		spr(historico_screen,240-(x/2))
		spr(screen,x)
		flip_original()
	end


end

function qnt_char(str,chrt)
	local n=0
	for j=1,#chrt do
		for i=1,#str do
			if sub(str,i,i)==sub(chrt,j,j) then n+=1 end
		end
	end
	return n
end

function pause_menu()
	
	flip_original()
	while not (keyp("backspace") or keyp("escape") or btnp(6))do
		spr(main_screen,0,0)
		
		pal(7,cores[2])
		
		spr(pause_screen,145,90)
		
		print("\#opressione q ou <- para sair ",10,10,cores[3])
		
		print("\#opressione m ou -> para voltar ao menu ",10,20,cores[3])
		
		print("\#opressione h ou x para ver o histo\^-#\v7,\^#rico ",10,30,cores[3])
		pal()
		
		if(key("q") or btnp(0)) then
		vid(1)
		set_draw_target()
		local fade=0
		while fade<135 do
		 	fade+=(136-fade)*0.1
		 	rectfill(0,0,480,fade,36)
		 	rectfill(0,270,480,270-fade,36)
		 	flip_original()
		end
		exit()
		--send_message(2, {event="shutdown"})
		while true do flip_original() end 
		end
		if(key("m") or btnp(1)) then flip=flip_original include("menu.lua")  end
		if(key("h") or btnp(5)) then historico() end
		if	save_time and (t()-save_time)<2.5 then
			icon_save()
		end
		flip_original()
	end
end









function slp(x)
	for i=1,x do flip() end
end



function pause(gat)
	while not (keyp("space") or keyp("enter") or btnp(4)) do flip() end
end



function falar(str,vel,pular)
	text=""
	historico_text..="\n\n"..nome_atual..":\n"
	adicionar(str,vel,pular)
end



function adicionar(str, vel,pular)
	vel=vel or 2
	rectfill(30,190,450,250,cores[1])
	rect(30,190,450,250,cores[3])
	for i=1,#str+1 do
		
		print(text,50,200,cores[3])
		slp(vel)
		if((keyp("space") or keyp("enter") or btnp(4))) text..=sub(str,i,#str) flip() break
		text..=sub(str,i,i)
	end
	historico_text..=str
	print(text,50,200,cores[3])
	if not pular then pause() end
	
	slp(10)
	
end



function nome(string,c)
	c=c or cores[1]
	nome_atual=string
	rrectfill(30,180,95,15,7,cores[3])
	print(string,75-((#string/2)*5),181,c)
end




function print_screen()
	local screen = userdata("u8",480,270)
	for x=0,479 do
		for y=0,269 do
			screen:set(x,y,pget(x,y))
		end
	end
	return screen
end




function tremer(quant)
	quant=quant or 10
	screen=print_screen()
	for i=1,quant do
	 spr(screen,i%5)
	 flip()	
	end
end




function escolher_1(...)
	local escolhas={...}
	local a=1
	local b=false
	while not (keyp("space") or keyp("enter") or btnp(4)) or not b do
		print("< "..escolhas[a].." >",230-(#escolhas[a]*2.5),235,cores[3])
		if not b then b=true slp(40) end
		flip()
		print("< "..escolhas[a].." >",230-(#escolhas[a]*2.5),235,cores[1])
		if(btnp(0)) a-=1
		if(btnp(1)) a+=1
		if(a<1) a=#escolhas
		if(a>#escolhas) a=1
	end
	historico_text..="\n\nvoce\vu^:\n"..escolhas[a]
	return escolhas[a]
end



function escolher_2(...)
	local escolhas={...}
	local a=1
	local screen=print_screen()
	local d=false
	while not (keyp("space") or keyp("enter") or btnp(4)) or not d do
		y=100-(#escolhas*10)
		
		for i=1,#escolhas do
			local c=i==a
			local c1,c2=c and cores[1] or cores[3],c and cores[3] or cores[1] 
			local b=((i-1)*20)
			rrectfill(240-90,y+b,180,15,2,c2)
			rrect(240-90,y+b,180,15,2,c1)
			print(escolhas[i],modi1+240-((#escolhas[i]-(qnt_char(escolhas[i],"~")*3))*2.5),y+b+4,c1)
		end
		if not d then d=true slp(40) end
		if(btnp(2) and a>1) a-=1
		if(btnp(3)and a<#escolhas) a+=1
		
		flip()
		
	end
	spr(screen)
	historico_text..="\n\nvoce\vu^:\n"..escolhas[a]
	return escolhas[a]
end




function save_game(str)
	local slot={str,save}
	mkdir("/appdata/ren")
	mkdir("/appdata/ren/teste")
	store("/appdata/ren/teste/slot1.save",slot)
	save_time=t()	
	carta_atual=flr(rnd(4))+1
end



function icon_save()
	local b=abs((t()*10)%(sqrt(16)*2)-sqrt(16))^2
	if b==16 then carta_atual+=1 end
	b=flr(b)
	if(carta_atual>4) carta_atual=1
	sspr(cartas_save[carta_atual],0,0,24,32,456+((b)/2),10,16-b,20)
end




esperar=slp
foto=spr
pausar=pause