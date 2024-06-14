library verilog;
use verilog.vl_types.all;
entity Sumador2bits_vlg_check_tst is
    port(
        C               : in     vl_logic;
        Q               : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end Sumador2bits_vlg_check_tst;
