onerror {exit -code 1}
vlib work
vlog -work work Proyecto.vo
vlog -work work Waveform5.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Prueba1_vlg_vec_tst -voptargs="+acc"
vcd file -direction Proyecto.msim.vcd
vcd add -internal Prueba1_vlg_vec_tst/*
vcd add -internal Prueba1_vlg_vec_tst/i1/*
run -all
quit -f
