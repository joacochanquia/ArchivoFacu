library verilog;
use verilog.vl_types.all;
entity GeneradorEstado_vlg_check_tst is
    port(
        Qm              : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end GeneradorEstado_vlg_check_tst;
