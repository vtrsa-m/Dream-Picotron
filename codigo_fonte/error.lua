--[[pod_format="raw",created="2025-07-21 04:58:09",modified="2025-09-18 18:10:41",revision=10]]
lim_x=480
lim_y=270
error_state=true
error_music_state=false
error_spr_1=--[[pod_type="gfx"]]unpod("b64:bHo0AFEDAAAhBAAAsXB4dQBDIMWzBPD-AQD-mmL4LfB2_DHwcvg18G74OfBq_D3wZvhB8GL4RfBe_EnwWvhN8Fb4UfBS_FXwTvhZ8Er4XfBH_F-wRfhh8EP4Y-BB_GXwP-hn8D34afA7_GvwOfht8Df4b-A1_HHwM-hz8DH4dfAv_HfwLfh58Cv4e-Ap_H3wJ-h-8CX4gfAj_IPwIfiF8B-4h-Ad_InwG-iL8Bn4jfAX_I-wFfiR8BP4k-AR_JXwD-iX8A4EACD-Hg34mfAM_JnwC-ib8Ar4m-AJ_J3wCPid8Af4n-AG_J-wBfih8AT4ofAD_KPwAgQANvOOJcD4H8D4JfAC_CPwAPgd8AD4I-AC_CHwA-gb8AP4IfAC_B-wBvgZ8Ab4H-AC_B3wCfgX8An4HfAC_BvwDPgV8Az4G-AC_BrwDvgT8A74GvAC_BnwD-gT8A-4GfAC_BjwEPgT8BD4GPAC_BfwEfgT8BH4F-AC_BbwEvgT8BL4FvAC_BXwE-gT8BP4FfAC_BTwFPgT8BT4FPAC_BPwFQQA8SwC_BLwFvgT8Bb4EvAC_BHwF-gT8Bf4EfAC_BDwGPgT8Bj4EPAC_A-wGfgT8Bn4D-AC_A7wDfgt8A34DgwAUwz4L-AMDABTC-gx8AsMAFMK_DPwCgwAUwn4NfAJDABRCPg38AgMAPEHD-AG_DnwBvgP8AP4D-AE_BUA_BXwBAsAAHMAIRUgtgDxWhDwBfgQ8AD4FUD4FfAA_BDwBvgR0PgVYPgV0PgR8Af4EbD4FYD4FbD4EfAI_EGg_EHwCfg-wPg-8Ar4PuD4PvAL_DzwAfg88Az4O-AD_DvwDfg58AX4OfAO_DjwB-g48A-4NvAJ_DbwEaQA8CA18BP4M-AL_DPwFfgy8Av4MvAX_DDwDfgw8Cv4HdAI0Pgd8D-4G_AI4Pgb8EH4GgkA8gEa8EP4GPAACPAA_BjwRfgXCwD-GxfwR-gV8AEI8AH4FfBJ_FvwS-hZ8E34V-BP_FXwUfhT8FP4UfBV_E-wVgQAMvEIFPAH_BTwV-gS8An4EvBZ_BDwC-gQ8FusAfAqDvBd_AzwD-gM8F-4CvAR_ArwYbjwK7jwYqjwLajwYpjwL5jwYojwMYjwYnjwM3jwYmjwNWjw--96")
error_spr_2=--[[pod_type="gfx"]]unpod("b64:bHo0ALoBAADzAQAA9A1weHUAQyDFWgTw-5B48Ht48BqY8HeY8Bqo8HWoBgBPuPBzuAYAHnEbqPBzqPAcBgBxHZjwc5jwHgYAcR_I8HOI8CAGAHEhePBzePAiBgBxI2jwc2jwJAYA8R8lWPBzWPAmaPBxaPAmePBvePAmiPBtiPAmmPBrmPAmqPBpqPAmuPBnuPAmyPAkAwDw-x0m2PAi6PAi2PAm6PAg_AHwIOjwJvgA8B74A-Ae_ADwJvgB8Bz4BfAc_AHwJvgC8Br4B-Aa_ALwJvgD8Az4IfAM_APwJ-gD8Ar4I-AK_APwKPgE8Aj4JfAI_ATwKfgE8Ab4J-AG_ATwKvgF8AT4KfAE_AXwK-gF8AL4K-AC_AXwLPh58C34d-Au_HfwL-h18DD4dfAx_HPwMvhz8DP4cfA1_G-wN-ht8Dn4a-A7_GnwPfhn8D-4ZfBB_GPwQ-hh8EX4X-BH_F3wSfhb8Ev4WfBN_FfwT-hV8FH4U-BT_FHwVfhP8Ff4TfBZ_EvwW-hJ8F34R-Bf_EXwYfhD8GP4QfBl_D-wZ-g98Gn4O-Br_Dnwbvg18HL4MfB2_C3wevgp8H74JfCC_CHw----UQ==")
set_draw_target()
function error_screen()
if not f then local f=true flip=flip_original or flip end
vid(0)
cls()
if ((t()*10)%10>5) mandibula=0 note(0,nil,0) else mandibula=4  note(25)
if not error_music_state then error_music_state=true end
sspr(error_spr_1,0,0,197,228,lim_x/2-(197/4),lim_y/2-(225/4)-30,197/2,228/2)
sspr(error_spr_2,0,0,197,228,lim_x/2-(197/4),lim_y/2-(225/4)+37+mandibula,197/2,228/2)
print("ERROR:",lim_x/2-14,lim_y/2+40,8)
print(error_msg,lim_x/2-(#error_msg*2.5),lim_y/2+50,8)
rect(0,0,lim_x-1,lim_y-1)
end
function _update()
if error_state and safe_update!=nil then error_state,error_msg=pcall(safe_update) end
end
function _draw()
if error_state and safe_draw!=nil then error_state,error_msg=pcall(safe_draw)
else error_screen() end
end