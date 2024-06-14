library verilog;
use verilog.vl_types.all;
entity LatchNAND_vlg_sample_tst is
    port(
        R               : in     vl_logic;
        S               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end LatchNAND_vlg_sample_tst;
