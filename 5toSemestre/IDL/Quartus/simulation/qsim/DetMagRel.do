onerror {exit -code 1}
vlib work
vlog -work work DetMagRel.vo
vlog -work work Waveform1.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.DetMagRel3bit_vlg_vec_tst -voptargs="+acc"
vcd file -direction DetMagRel.msim.vcd
vcd add -internal DetMagRel3bit_vlg_vec_tst/*
vcd add -internal DetMagRel3bit_vlg_vec_tst/i1/*
run -all
quit -f
