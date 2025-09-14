#include scripts\core_common\struct;
#include scripts\core_common\callbacks_shared;
#include scripts\core_common\clientfield_shared;
#include scripts\core_common\math_shared;
#include scripts\core_common\system_shared;
#include scripts\core_common\util_shared;
#include scripts\core_common\hud_util_shared;
#include scripts\core_common\hud_message_shared;
#include scripts\core_common\hud_shared;
#include scripts\core_common\array_shared;
#include scripts\core_common\flag_shared;
#include scripts\zm_common\gametypes\dev.gsc;
#include scripts\zm_common\zm_score.gsc;
#include scripts\zm_common\util.gsc;
#include scripts\zm_common\zm_audio.gsc;
#include scripts\zm_common\zm_powerups.gsc;
#include scripts\zm_common\zm_stats.gsc;
#include scripts\zm_common\zm_power.gsc;
#include scripts\zm_common\zm_hero_weapon.gsc;
#include scripts\zm_common\zm_pack_a_punch_util.gsc;
#include scripts\zm_common\zm_pack_a_punch.gsc;
#include scripts\zm_common\zm_weapons.gsc;
#include scripts\core_common\aat_shared.gsc;
#include scripts\core_common\ai\zombie_utility.gsc;
#include scripts\zm_common\zm_utility.gsc;
#include scripts\zm_common\zm_equipment.gsc;
#include scripts\zm_common\zm_perks.gsc;
#include scripts\zm_common\zm_magicbox.gsc;
#include scripts\core_common\rank_shared.gsc;
#include scripts\zm_common\zm_blockers.gsc;
#include scripts\core_common\exploder_shared.gsc;
#include scripts\core_common\challenges_shared.gsc;
#include scripts\zm_common\zm_round_logic.gsc;
#include scripts\zm_common\gametypes\globallogic_score.gsc;
#include scripts\zm_common\gametypes\globallogic.gsc;
#include scripts\core_common\contracts_shared.gsc;
#include scripts\core_common\player\player_stats.gsc;
#include scripts\zm_common\zm_loadout.gsc;
#include scripts\core_common\match_record.gsc;
#include scripts\zm_common\zm_laststand.gsc;
#include scripts\core_common\laststand_shared.gsc;
#include scripts\zm_common\zm_bgb.gsc;

#namespace lucy_menu;

autoexec __init__sytem__()
{
	system::register("lucy_menu", &__init__, undefined, undefined);

    setGametypeSetting(#"hash_3c5363541b97ca3e", 1); // ee enabled
    setDvar(#"zm_ee_enabled", 1);
    setDvar(#"zm_debug_ee", 0); // revert IX fast ee
    setDvar(#"hash_2b64162aa40fe2bb", 0); // ^

    // no contract
    level.var_aa2d5655 = undefined;
    // can xp
    level.var_5164a0ca = undefined;
    // xp multi
    level.var_3426461d = &GetXPMultiplier; // has to be done even with detours
    // disable ee
    level.var_73d1e054 = undefined;
    // end game mode type
    level.var_211e3a53 = undefined;
}

__init__()
{
    callback::on_start_gametype(&init);
    callback::on_spawned(&onPlayerSpawned);
}
