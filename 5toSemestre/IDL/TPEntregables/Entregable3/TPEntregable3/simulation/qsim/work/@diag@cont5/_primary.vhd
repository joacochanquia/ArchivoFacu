library verilog;
use verilog.vl_types.all;
entity DiagCont5 is
    port(
        Q1              : out    vl_logic;
        CLK             : in     vl_logic;
        Q2              : out    vl_logic;
        C               : out    vl_logic;
        Q0              : out    vl_logic
    );
end DiagCont5;
