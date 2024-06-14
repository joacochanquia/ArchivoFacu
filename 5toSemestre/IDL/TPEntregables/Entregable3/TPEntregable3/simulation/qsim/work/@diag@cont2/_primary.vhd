library verilog;
use verilog.vl_types.all;
entity DiagCont2 is
    port(
        Q               : out    vl_logic;
        CLK             : in     vl_logic;
        C               : out    vl_logic
    );
end DiagCont2;
