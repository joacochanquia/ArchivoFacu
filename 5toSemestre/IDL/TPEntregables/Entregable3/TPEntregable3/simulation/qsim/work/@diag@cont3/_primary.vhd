library verilog;
use verilog.vl_types.all;
entity DiagCont3 is
    port(
        Q0              : out    vl_logic;
        CLK             : in     vl_logic;
        Q1              : out    vl_logic;
        C               : out    vl_logic
    );
end DiagCont3;
