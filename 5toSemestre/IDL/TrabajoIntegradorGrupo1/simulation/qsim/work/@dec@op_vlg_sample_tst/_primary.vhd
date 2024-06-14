library verilog;
use verilog.vl_types.all;
entity DecOp_vlg_sample_tst is
    port(
        OP              : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end DecOp_vlg_sample_tst;
