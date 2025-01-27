extends Node


#declares iron_amount as int
var iron_amount := 3
var battery_amount := 2
var carbonfiber_amount := 1
var wire_amount := 2
var electormagnet_amount := 0
var circuitboard_amount := 0
var hoverboard_amount := 0

func add_iron():
	iron_amount += 1

func add_battery():
	battery_amount += 1

func add_wire():
	wire_amount += 1

func add_carbonfiber():
	carbonfiber_amount += 1

func add_electromagnet():
	electormagnet_amount += 1

func add_circuitboard():
	circuitboard_amount += 1

func add_hoverboard():
	hoverboard_amount += 1
