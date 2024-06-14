library verilog;
use verilog.vl_types.all;
entity GenPar_vlg_sample_tst is
    port(
        b               : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end GenPar_vlg_sample_tst;
