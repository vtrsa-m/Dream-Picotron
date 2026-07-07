--[[pod_format="raw",created="2025-09-17 15:58:19",modified="2025-09-18 22:34:42",revision=10]]


function game_init()
	modi1=0
	window{pauseable=false, capture_escapes=true}
	save_state=fetch("/appdata/ren/teste/slot1.save")	
	fetch("pal/1.pal"):poke(0x5000)
	game_main=fetch "game.lua"
	game_main=load("goto "..(save_state and save_state[1] or "inicio").."\n"..game_main)
	main_screen=userdata("u8",480,270)
	historico_screen=userdata("u8",480,270)
	historico_text=""
	text=""
	nome_atual=""
	save=(save_state and save_state[2] or {})
	cartas_save={
--[[pod_type="gfx"]]unpod("b64:bHo0AEQAAABJAAAA9iRweHUAQyAYIAQg9wJA9wQg9wYA93MV9wU19wNV9wF155XHtafVh-UAd-UAh9WntceV9wIeAMD3cAD3BiD3BED3AiA=")
	,
--[[pod_type="gfx"]]unpod("b64:bHo0AEUAAABDAAAA8DRweHUAQyAYIAQg9wJA9wQg9wYA988YVxjHODc4p1gXWIf4AHf4AIfYp7jHmOd49wFY9wM49wUY93MA9wYg9wRA9wIg")
	,
--[[pod_type="gfx"]]unpod("b64:bHo0AEQAAABKAAAA8BJweHUAQyAYIAQg9wJA9wQg9wYA93MV9wU19wNV9wF19wADAPcA55XHtZf1AIfVp7XHlfcCHwCwcAD3BiD3BED3AiA=")
	,
--[[pod_type="gfx"]]unpod("b64:bHo0AEoAAABIAAAA8DlweHUAQyAYIAQg9wJA9wQg9wYA93MY9wU49wNY9wF455jHuKfYh-gAd-gAh9inuMeY53j3AVj3Azj3BRj3cwD3BiD3BED3AiA=")
}

pause_screen=
--[[pod_type="gfx"]]unpod("b64:bHo0AFsBAAA_BQAAs3B4dQBDIL5aBPD-AQDxEuT3A-AC18B3cHfA9wNw9whw9wOg9wTwAPcAsHdwd7D3BBQA4QSQ9wXQ9wKgd3B3oPcFEwDhBYD3BrD3BJB3cHeQ9wYTAOEGcPcHkPcGgHdwd4D3BxMAIAdgBgBRCHB3cHcQAA8TABgmd3ACAJmX8AaX8AZ3cGcWAGyH8AeH8AcWADB38AgDAA8WAD4ObgAKmgAHwwAhA8AKAAkUAC4EsBQAJAWgFAAiB4AUAESA9wWQFAASBgoAIHeQbAEDFAADMgAEhgEBFAADWgAErQEBFAADggAE1QEAFAAB0wABAgAw8AaXuAALFQAgB4fjAAsVABMIBQAPFQD--zMOYQIPiwIBJ-cIAwQPEwAYQoD3BoBHAwUTABCQuAQiBpCbBAITAEKg9wKgRQMy9wWAEwBCsPcAsEQDAM4EARMAMsDXwEIDI-cDKQVQ-----2U=")

end

function game_draw()
include"menu.lua"
include "tools.lua"
set_draw_target(main_screen)
jogo_iniciado=true
game_main()
end


