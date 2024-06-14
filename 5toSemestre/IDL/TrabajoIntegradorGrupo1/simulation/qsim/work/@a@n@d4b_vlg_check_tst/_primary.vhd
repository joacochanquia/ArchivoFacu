library verilog;
use verilog.vl_types.all;
entity AND4b_vlg_check_tst is
    port(
        R               : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end AND4b_vlg_check_tst;
