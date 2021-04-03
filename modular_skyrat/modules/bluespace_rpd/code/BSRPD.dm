/*
CONTAINS:
BSRPD
*/

#define ATMOS_CATEGORY 0
#define DISPOSALS_CATEGORY 1
#define TRANSIT_CATEGORY 2

#define BUILD_MODE (1<<0)
#define WRENCH_MODE (1<<1)
#define DESTROY_MODE (1<<2)
#define PAINT_MODE (1<<3)

/obj/item/pipe_dispenser/bluespace
	name = "Bluespace Rapid Piping Device (BSRPD)"
	desc = "A device used to rapidly pipe things at a distance."
	icon = 'modular_skyrat/modules/bluespace_rpd/icons/bsrpd.dmi'
	icon_state = "bsrpd"
	lefthand_file = 'modular_skyrat/modules/bluespace_rpd/icons/bsrpd_lefthand.dmi'
	righthand_file = 'modular_skyrat/modules/bluespace_rpd/icons/bsrpd_righthand.dmi'
	custom_materials = list(/datum/material/iron=75000, /datum/material/glass=37500, /datum/material/bluespace=1000)

/obj/item/pipe_dispenser/bluespace/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(proximity_flag)
		return // this will be handled in pre_attack in RPD.dm
	user.Beam(target, icon_state = "rped_upgrade", time = 5)
	playsound(src, 'sound/items/pshoom.ogg', 30, TRUE)
	dispense(target, user)

#undef ATMOS_CATEGORY
#undef DISPOSALS_CATEGORY
#undef TRANSIT_CATEGORY

#undef BUILD_MODE
#undef DESTROY_MODE
#undef PAINT_MODE
#undef WRENCH_MODE
