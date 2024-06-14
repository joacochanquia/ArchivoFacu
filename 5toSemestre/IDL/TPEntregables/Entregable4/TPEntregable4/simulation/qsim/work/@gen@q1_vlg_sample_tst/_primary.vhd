library verilog;
use verilog.vl_types.all;
entity GenQ1_vlg_sample_tst is
    port(
        Q               : in     vl_logic_vector(5 downto 0);
        sampler_tx      : out    vl_logic
    );
end GenQ1_vlg_sample_tst;
