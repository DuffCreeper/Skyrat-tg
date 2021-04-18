/obj/machinery/tinyfan
	icon = 'icons/obj/lavaland/survival_pod.dmi'
	icon_state = "fan_tiny"
	name = "tiny fan"
	desc = "A tiny fan, releasing a thin gust of air. You can see bolts in each corner on this model"
	circuit = /obj/item/circuitboard/machine/tinyfan
	layer = ABOVE_NORMAL_TURF_LAYER
	density = FALSE
	anchored = FALSE
	CanAtmosPass = ATMOS_PASS_NO
	pass_flags = PASSTABLE

/obj/machinery/tinyfan/Initialize()
	. = ..()
	var/turf/local = get_turf(loc)
	air_update_turf(TRUE, TRUE)

/obj/machinery/tinyfan/Destroy()
	var/turf/local = get_turf(loc)
	air_update_turf(TRUE, FALSE)

/obj/machinery/tinyfan/process(delta_time)

/obj/machinery/tinyfan/wrench_act(mob/living/user, obj/item/I)
	..()
	default_unfasten_wrench(user, I)
	return TRUE

//Stuff
/datum/techweb_node/tinyfan
	id = "tiny_fan"
	display_name = "High Speed Atmos Fans"
	description = "Using Atmospheric Science, give Engineering the ability to create a barrier of wind!"
	prereq_ids = list("emp_basic")
	design_ids = list("tinyfan")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 500)

/datum/design/board/tinyfan
	name = "Machine Design (Tiny Fan)"
	desc = "The circuit board for a Tiny Fan."
	id = "tinyfan"
	build_path = /obj/item/circuitboard/machine/tinyfan
	category = list ("Engineering Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/obj/item/circuitboard/machine/tinyfan
	name = "Tiny Fan (Machine Board)"
	icon_state = "engineering"
	build_path = /obj/machinery/tinyfan
	req_components = list(
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stack/cable_coil = 1)
	needs_anchored = FALSE
