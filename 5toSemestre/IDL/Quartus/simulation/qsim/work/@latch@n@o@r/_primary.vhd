library verilog;
use verilog.vl_types.all;
entity LatchNOR is
    port(
        Qn              : out    vl_logic;
        R               : in     vl_logic;
        S               : in     vl_logic;
        Q               : out    vl_logic
    );
end LatchNOR;
