library verilog;
use verilog.vl_types.all;
entity DetMagRel3bit is
    port(
        M               : out    vl_logic;
        x0              : in     vl_logic;
        y0              : in     vl_logic;
        x1              : in     vl_logic;
        y1              : in     vl_logic;
        x2              : in     vl_logic;
        y2              : in     vl_logic;
        N               : out    vl_logic;
        P               : out    vl_logic
    );
end DetMagRel3bit;
