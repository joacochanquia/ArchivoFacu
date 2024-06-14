library verilog;
use verilog.vl_types.all;
entity MaquinaMoore2_vlg_check_tst is
    port(
        A0              : in     vl_logic;
        A1              : in     vl_logic;
        A2              : in     vl_logic;
        R0              : in     vl_logic;
        R1              : in     vl_logic;
        R2              : in     vl_logic;
        V0              : in     vl_logic;
        V1              : in     vl_logic;
        V2              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end MaquinaMoore2_vlg_check_tst;
