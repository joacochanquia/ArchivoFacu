library verilog;
use verilog.vl_types.all;
entity LatchNAND is
    port(
        Q               : out    vl_logic;
        R               : in     vl_logic;
        S               : in     vl_logic;
        Qn              : out    vl_logic
    );
end LatchNAND;
