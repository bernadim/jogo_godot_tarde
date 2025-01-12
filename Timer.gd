extends Timer

@onready var contador_pontos = $MarginContainer/HBoxContainer/contador_pontos
@onready var timer_count = $MarginContainer/HBoxContainer2/timer_count
@onready var timer = $timer_cont as Timer

signal tempo_acabou() #para recarregar no mundo

var minutos = 0
var segundos = 0

#limitar tempo
@export_range(0,2) var min_padrao = 1 
@export_range(0,59) var seg_padrao = 0

func _ready():
	contador_pontos.text = str("%03d" % Global.somaPontos)
	timer_count.text = str("%02d"  % min_padrao) + ":" +str("%02d" % seg_padrao)
	
	minutos = min_padrao
	segundos = seg_padrao
	




func _process(delta):
	contador_pontos.text = str ("%03d" % Global.somaPontos)
	if minutos ==0 && segundos ==0:
		emit_signal("tempo_acabou")
		

func _on_timer_cont_timeout():
	if segundos ==0:
		if minutos >0:
			minutos-=1
			segundos = 60
			
	segundos -=1

	timer_count.text = str("%02d" % minutos) + ":" +str("%02d" % segundos)
