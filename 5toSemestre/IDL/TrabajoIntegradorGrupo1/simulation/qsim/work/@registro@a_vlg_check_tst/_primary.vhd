library verilog;
use verilog.vl_types.all;
entity RegistroA_vlg_check_tst is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        E               : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end RegistroA_vlg_check_tst;
