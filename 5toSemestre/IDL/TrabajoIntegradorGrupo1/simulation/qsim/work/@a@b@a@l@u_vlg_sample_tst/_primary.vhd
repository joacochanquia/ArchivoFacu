library verilog;
use verilog.vl_types.all;
entity ABALU_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        Fa              : in     vl_logic_vector(3 downto 0);
        Op              : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end ABALU_vlg_sample_tst;
