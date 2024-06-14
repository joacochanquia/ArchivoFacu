library verilog;
use verilog.vl_types.all;
entity GeneradorEstado_vlg_sample_tst is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        Q               : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end GeneradorEstado_vlg_sample_tst;
