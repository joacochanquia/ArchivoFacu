library verilog;
use verilog.vl_types.all;
entity Resta_vlg_check_tst is
    port(
        Cout            : in     vl_logic;
        R               : in     vl_logic_vector(3 downto 0);
        V               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Resta_vlg_check_tst;
