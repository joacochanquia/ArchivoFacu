onerror {exit -code 1}
vlib work
vlog -work work Proyecto4.vo
vlog -work work WaveformMoore.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.MaquinaMoore_vlg_vec_tst -voptargs="+acc"
vcd file -direction Proyecto4.msim.vcd
vcd add -internal MaquinaMoore_vlg_vec_tst/*
vcd add -internal MaquinaMoore_vlg_vec_tst/i1/*
run -all
quit -f
