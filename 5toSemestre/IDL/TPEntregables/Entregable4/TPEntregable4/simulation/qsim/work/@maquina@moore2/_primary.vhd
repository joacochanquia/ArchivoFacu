library verilog;
use verilog.vl_types.all;
entity MaquinaMoore2 is
    port(
        V1              : out    vl_logic;
        CLK             : in     vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic;
        V2              : out    vl_logic;
        V0              : out    vl_logic;
        A1              : out    vl_logic;
        A2              : out    vl_logic;
        A0              : out    vl_logic;
        R1              : out    vl_logic;
        R2              : out    vl_logic;
        R0              : out    vl_logic
    );
end MaquinaMoore2;
