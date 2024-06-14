library verilog;
use verilog.vl_types.all;
entity Flags_vlg_sample_tst is
    port(
        Q               : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end Flags_vlg_sample_tst;
