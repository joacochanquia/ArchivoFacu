library verilog;
use verilog.vl_types.all;
entity DetPar_vlg_check_tst is
    port(
        impar           : in     vl_logic;
        par             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end DetPar_vlg_check_tst;
