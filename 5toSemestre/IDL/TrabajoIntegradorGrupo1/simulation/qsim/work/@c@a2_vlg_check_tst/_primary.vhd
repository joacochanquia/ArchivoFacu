library verilog;
use verilog.vl_types.all;
entity CA2_vlg_check_tst is
    port(
        R               : in     vl_logic_vector(3 downto 0);
        V               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end CA2_vlg_check_tst;
