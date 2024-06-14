library verilog;
use verilog.vl_types.all;
entity DetMagRel1bit is
    port(
        M               : out    vl_logic;
        X               : in     vl_logic;
        Y               : in     vl_logic;
        N               : out    vl_logic;
        P               : out    vl_logic
    );
end DetMagRel1bit;
