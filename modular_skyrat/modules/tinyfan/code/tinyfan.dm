/obj/machinery/tinyfan
	icon = 'icons/obj/lavaland/survival_pod.dmi'
	icon_state = "fan_tiny"
	name = "tiny fan"
	desc = "A tiny fan, releasing a thin gust of air. You can see bolts in each corner on this model."
	circuit = /obj/item/circuitboard/machine/tinyfan
	layer = ABOVE_NORMAL_TURF_LAYER
	density = FALSE
	anchored = TRUE
	CanAtmosPass = ATMOS_PASS_NO
	pass_flags = PASSTABLE

/obj/machinery/tinyfan/Initialize()
	. = ..()
	air_update_turf(TRUE, TRUE)

/obj/machinery/tinyfan/wrench_act(mob/living/user, obj/item/I)
    . = ..()
	air_update_turf(TRUE, anchored)
	return ..()

//Techweb
/datum/techweb_node/tinyfan
	id = "tiny_fan"
	display_name = "High Speed Atmos Fans"
	description = "Using Atmos Science, give Engineering the ability to create a barrier of wind!"
	prereq_ids = list("emp_basic")
	design_ids = list("tinyfan")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 500)

//Circuit Printer Design
/datum/design/board/tinyfan
	name = "Machine Design (Tiny Fan)"
	desc = "The circuit board for a Tiny Fan."
	id = "tinyfan"
	build_path = /obj/item/circuitboard/machine/tinyfan
	category = list ("Engineering Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

//Circuitboard
/obj/item/circuitboard/machine/tinyfan
	name = "Tiny Fan (Machine Board)"
	icon_state = "engineering"
	build_path = /obj/machinery/tinyfan
	req_components = list(
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stack/cable_coil = 1)
	needs_anchored = FALSE
