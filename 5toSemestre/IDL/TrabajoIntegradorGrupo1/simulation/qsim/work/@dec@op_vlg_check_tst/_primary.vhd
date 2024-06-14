library verilog;
use verilog.vl_types.all;
entity DecOp_vlg_check_tst is
    port(
        I               : in     vl_logic;
        OPE             : in     vl_logic_vector(2 downto 0);
        OPI             : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end DecOp_vlg_check_tst;
