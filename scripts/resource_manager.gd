extends Node


#declares iron_amount as int
var iron_amount := 0
var battery_amount := 0
var electormagnet_amount := 0
var circuitboard_amount := 0

func add_iron():
	iron_amount += 1

func add_battery():
	battery_amount += 1

func add_electromagnet():
	electormagnet_amount += 1

func add_circuitboard():
	circuitboard_amount += 1
