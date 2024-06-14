library verilog;
use verilog.vl_types.all;
entity GeneradorSalidas_vlg_check_tst is
    port(
        L               : in     vl_logic_vector(8 downto 0);
        sampler_rx      : in     vl_logic
    );
end GeneradorSalidas_vlg_check_tst;
